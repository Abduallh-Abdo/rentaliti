import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaliti/auth/forgot_pass/forgot_password.dart';
import 'package:rentaliti/auth/login/cubit/login_cubit.dart';
import 'package:rentaliti/auth/login/cubit/login_state.dart';
import 'package:rentaliti/auth/register/register_screen.dart';
import 'package:rentaliti/components/components.dart';
import 'package:rentaliti/screens/Home/homeScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) async {
          if (state is LoginSuccessState) {
            // Assuming user UID is fetched from state or FirebaseAuth instance
            String? userId = FirebaseAuth.instance.currentUser?.uid;

            if (userId != null) {
              // Fetch user data from Firestore based on the UID
              DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
                  .collection('users')
                  .doc(userId)
                  .get();

              if (userSnapshot.exists) {
                // Get user details from Firestore
                String username = userSnapshot['name'] ?? 'Guest';
                String? imageUrl =
                    userSnapshot['imageUrl']; // Assuming imageUrl is stored

                // Navigate to HomeScreen with user details
                navigateAndFinish(
                  context: context,
                  widget: HomeScreen(
                    username: username,
                    image:
                        imageUrl ?? '', // Pass empty string if imageUrl is null
                  ),
                );
              } else {
                // Handle the case where user data doesn't exist in Firestore
                defaultToast(
                  msg: 'User data not found!',
                  state: ToastStates.error,
                );
              }
            } else {
              defaultToast(
                msg: 'Unable to fetch user data!',
                state: ToastStates.error,
              );
            }
          } else if (state is LoginErrorState) {
            // Show error toast in case of login failure
            defaultToast(
              msg: state.error,
              state: ToastStates.error,
            );
          }
        },
        builder: (context, state) {
          LoginCubit loginCubit = LoginCubit.get(context);
          return Scaffold(
            body: Form(
              key: loginCubit.loginFormKey,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffe74b1a),
                            Color(0x00ffffff),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.5,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      // child: Text(''),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 50,
                        left: 30,
                        right: 20,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            width: 180,
                            height: 180,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 1.8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Rakkas',
                                    ),
                                  ),
                                  defaultFormField(
                                    focusedBorder: const UnderlineInputBorder(),
                                    controller: loginCubit.emailController,
                                    hintText: 'Email',
                                    prefix: Icons.email_outlined,
                                    type: TextInputType.emailAddress,
                                    validate: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      // Additional email validation (optional)
                                      final emailRegex =
                                          RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                      if (!emailRegex.hasMatch(value)) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  defaultFormField(
                                    focusedBorder: const UnderlineInputBorder(),
                                    controller: loginCubit.passController,
                                    hintText: 'password',
                                    suffix: loginCubit.suffix,
                                    prefix: Icons.password,
                                    obscureText: loginCubit.isPassword,
                                    suffixPressed: () {
                                      loginCubit.changePasswordVisibility();
                                    },
                                    type: TextInputType.visiblePassword,
                                    validate: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                    onSubmit: (p0) {
                                      if (loginCubit.loginFormKey.currentState!
                                          .validate()) {
                                        loginCubit.userLogin(
                                          email:
                                              loginCubit.emailController.text,
                                          password:
                                              loginCubit.passController.text,
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  defaultTextButton(
                                    text: 'Frogot Password?',
                                    onPressed: () {
                                      navigateTo(
                                        context: context,
                                        widget: const ForgotPassword(),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  ConditionalBuilder(
                                    condition: state is! LoginLoadingState,
                                    fallback: (context) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    builder: (context) => defaultButton(
                                      radius: 20,
                                      width: 150,
                                      color: const Color(0xffff5722),
                                      text: 'Login',
                                      onPressed: () {
                                        if (loginCubit
                                            .loginFormKey.currentState!
                                            .validate()) {
                                          loginCubit.userLogin(
                                            email:
                                                loginCubit.emailController.text,
                                            password:
                                                loginCubit.passController.text,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  // fontFamily: 'Rakkas',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              defaultTextButton(
                                  text: 'Sign Up',
                                  color: const Color(0xffff5722),
                                  onPressed: () {
                                    navigateAndFinish(
                                      context: context,
                                      widget: const RegisterScreen(),
                                    );
                                  })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
