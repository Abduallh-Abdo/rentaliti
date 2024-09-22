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
        listener: (context, state) {
          if (state is LoginSuccessState) {
            navigateAndFinish(
              context: context,
              widget: Homescreen(),
            );
          } else if (state is LoginErrorState) {
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
                            Color(0xffff5c30),
                            Color(0xffe74b1a),
                          ],
                        ),
                      ),
                      // child: Text(''),
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
                          // Center(
                          //   child: Image.asset(
                          //     'assets/images/logo.png',
                          //     width: MediaQuery.of(context).size.width,
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
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
                                      fontFamily: 'Poppins',
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
                                  defaultButton(
                                    radius: 20,
                                    width: 150,
                                    color: const Color(0xffff5722),
                                    text: 'Login',
                                    onPressed: () {
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
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 8,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
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
