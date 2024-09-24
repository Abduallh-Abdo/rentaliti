import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaliti/auth/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  final FirebaseAuth authRegister = FirebaseAuth.instance;
  User? user;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

  // Sign up with Firebase Auth
  void userSignUp({
    required String name,
    required String email,
    required String password,
    required Future<void> Function(String uid) onSuccess,
  }) async {
    emit(RegisterLoadingState());

    try {
      // Create user with Firebase Auth
      UserCredential userCredential = await authRegister
          .createUserWithEmailAndPassword(email: email, password: password);
      
      user = userCredential.user;
      
      if (user != null) {
        // Execute callback for successful signup (useful for navigating or further actions)
        await onSuccess(user!.uid);

        // Save user data to Firestore
        // await addUserToFirestore(
        //   uid: user!.uid,
        //   fullName: name,
        //   email: email,
        // );

        // Emit success state
        emit(RegisterSuccessState(
          fullName: name,
          email: email,
        ));
      }
    } catch (error) {
      log("Error during registration: $error");
      emit(RegisterErrorState(error.toString()));
    }
  }

  // Save user info to Firestore
  Future<void> addUserToFirestore({
    required String uid,
    required String fullName,
    required String email,
  }) async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection('users');

      await users.doc(uid).set({
        'full_name': fullName,
        'email': email,
        // Don't store the password. Use Firebase Auth for authentication.
      });

      log("User added to Firestore");
    } catch (error) {
      log("Failed to add user: $error");
      throw Exception("Failed to add user to Firestore.");
    }
  }

  File? image;

  // Image picker method
  void imagePick({required File imagepicked}) {
    image = imagepicked;
    emit(RegisterImagePickState());
  }
}
