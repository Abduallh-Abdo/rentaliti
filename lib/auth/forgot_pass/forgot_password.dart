
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaliti/auth/forgot_pass/cubit/forgot_password_cubit.dart';
import 'package:rentaliti/auth/forgot_pass/cubit/forgot_password_state.dart';
import 'package:rentaliti/auth/register/register_screen.dart';
import 'package:rentaliti/components/components.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordStates>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccessState) {
            // Handle success, such as showing a success message
            defaultToast(
              msg: 'Reset link sent to your email.',
              state: ToastStates.success,
            );
          } else if (state is ForgotPasswordErrorState) {
            // Handle error, such as showing an error message
            defaultToast(
              msg: state.error,
              state: ToastStates.error,
            );
          }
        },
        builder: (context, state) {
          final forgotPasswordCubit = ForgotPasswordCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Form(
                key: forgotPasswordCubit.forgotPassFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Password Recovery',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Enter Your Email',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontFamily: 'Poppins',
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.white),
                            ),
                            child: defaultFormField(
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              color: Colors.white,
                              controller: forgotPasswordCubit.mailController,
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                final emailRegex =
                                    RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                if (!emailRegex.hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              labelText: 'Email',
                              textColor: Colors.white,
                              type: TextInputType.emailAddress,
                              prefix: Icons.email_outlined,
                              iconColor: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 40),
                          defaultButton(
                            radius: 10,
                            width: double.infinity,
                            color: Colors.white,
                            textColor: Colors.black,
                            text: 'Reset Password',
                            onPressed: () {
                              if (forgotPasswordCubit
                                  .forgotPassFormKey.currentState!
                                  .validate()) {
                                forgotPasswordCubit.resetPassword(
                                  email:
                                      forgotPasswordCubit.mailController.text,
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              defaultTextButton(
                                text: 'Create',
                                color: const Color.fromARGB(255, 255, 231, 135),
                                onPressed: () {
                                  navigateAndFinish(
                                    context: context,
                                    widget: const RegisterScreen(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
