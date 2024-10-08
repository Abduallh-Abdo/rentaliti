import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaliti/auth/login/login_screen.dart';
import 'package:rentaliti/auth/register/cubit/register_cubit.dart';
import 'package:rentaliti/auth/register/cubit/register_state.dart';
import 'package:rentaliti/components/components.dart';
import 'package:rentaliti/screens/Home/homeScreen.dart';
import 'package:rentaliti/service/cloud_storage_service.dart';
import 'package:rentaliti/service/db_service.dart';
import 'package:rentaliti/service/media_service.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            String? imageUrl = RegisterCubit.get(context).image != null
                ? RegisterCubit.get(context)
                    .image!
                    .path // If image picked from local
                : '';
            // Proceed to next screen or actions after successful registration
            navigateAndFinish(
              context: context,
              widget: HomeScreen(
                image: imageUrl,
                username:
                    RegisterCubit.get(context).nameController.text.isNotEmpty
                        ? RegisterCubit.get(context).nameController.text
                        : 'Guest',
              ),
            );
          } else if (state is RegisterErrorState) {
            // Show error on registration failure
            defaultToast(
              msg: state.error,
              state: ToastStates.error,
            );
          }
        },
        builder: (context, state) {
          RegisterCubit registerCubit = RegisterCubit.get(context);
          return Scaffold(
            body: Form(
              key: registerCubit.registerFormKey,
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
                            Color(0x00ffffff),
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
                          Center(
                            child: Image.asset(
                              'assets/images/login_photo.png',
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 1.6,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Rakkas',
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      File? pickedImage = await MediaService
                                          .instance
                                          .getImageFromFile();
                                      if (pickedImage != null) {
                                        // Image selected successfully
                                        print(
                                            'Image selected: ${pickedImage.path}');
                                        registerCubit.imagePick(
                                            imagepicked: pickedImage);
                                      } else {
                                        // No image was selected
                                        print('No image selected');
                                      }
                                    },
                                    child: Center(
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: registerCubit.image !=
                                                null
                                            ? FileImage(registerCubit
                                                .image!) // Show selected image
                                            : AssetImage('assets/car.png')
                                                as ImageProvider, // Default image or placeholder
                                      ),
                                    ),
                                  ),
                                  defaultFormField(
                                    focusedBorder: const UnderlineInputBorder(),
                                    controller: registerCubit.nameController,
                                    validate: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                    hintText: 'Name',
                                    type: TextInputType.name,
                                    prefix: Icons.person,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  defaultFormField(
                                    focusedBorder: const UnderlineInputBorder(),
                                    controller: registerCubit.emailController,
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
                                    controller: registerCubit.passController,
                                    hintText: 'password',
                                    suffix: registerCubit.suffix,
                                    prefix: Icons.password,
                                    obscureText: registerCubit.isPassword,
                                    suffixPressed: () {
                                      registerCubit.changePasswordVisibility();
                                    },
                                    type: TextInputType.visiblePassword,
                                    validate: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                    onSubmit: (p0) {
                                      if (registerCubit
                                          .registerFormKey.currentState!
                                          .validate()) {
                                        registerCubit.userSignUp(
                                          name:
                                              registerCubit.nameController.text,
                                          email: registerCubit
                                              .emailController.text,
                                          password:
                                              registerCubit.passController.text,
                                          onSuccess: (uid) async {
                                            var result =
                                                await CloudStorageService
                                                    .instance
                                                    .uploadUserImage(
                                              uid,
                                              registerCubit.image!,
                                            );
                                            var imageUrl = await result!.ref
                                                .getDownloadURL();
                                            await DBService.instance
                                                .createUserInDB(
                                              uid: uid,
                                              imageUrl: imageUrl,
                                              name: registerCubit
                                                  .nameController.text,
                                              email: registerCubit
                                                  .emailController.text,
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  ConditionalBuilder(
                                    condition: state is! RegisterLoadingState,
                                    fallback: (context) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    builder: (context) => defaultButton(
                                      radius: 20,
                                      width: 150,
                                      color: const Color(0xffff5722),
                                      text: 'Sign Up',
                                      onPressed: () {
                                        if (registerCubit
                                            .registerFormKey.currentState!
                                            .validate()) {
                                          registerCubit.userSignUp(
                                            name: registerCubit
                                                .nameController.text,
                                            email: registerCubit
                                                .emailController.text,
                                            password: registerCubit
                                                .passController.text,
                                            onSuccess: (uid) async {
                                              var result =
                                                  await CloudStorageService
                                                      .instance
                                                      .uploadUserImage(
                                                uid,
                                                registerCubit.image!,
                                              );
                                              var imageUrl = await result!.ref
                                                  .getDownloadURL();
                                              await DBService.instance
                                                  .createUserInDB(
                                                uid: uid,
                                                imageUrl: imageUrl,
                                                name: registerCubit
                                                    .nameController.text,
                                                email: registerCubit
                                                    .emailController.text,
                                              );
                                            },
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
                            // height: 20,
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              defaultTextButton(
                                text: 'Login',
                                color: const Color(0xffff5722),
                                onPressed: () {
                                  navigateAndFinish(
                                    context: context,
                                    widget: const LoginScreen(),
                                  );
                                },
                              ),
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
