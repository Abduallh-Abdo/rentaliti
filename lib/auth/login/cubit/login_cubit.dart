import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaliti/auth/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(LoginChangePasswordVisibilityState());
  }

  // Firebase Authentication
  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((userCredential) {
      // Emit user data upon successful login
      log("User logged in: ${userCredential.user!.email}, UID: ${userCredential.user!.uid}");
      emit(LoginSuccessState(
        email: userCredential.user!.email ?? '',
        uid: userCredential.user!.uid,
      ));
    }).catchError((error) {
      String errorMessage = _handleFirebaseAuthError(error);
      emit(LoginErrorState(error: errorMessage));
    });
  }

  // Handle Firebase Auth errors for user-friendly messages
  String _handleFirebaseAuthError(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          return 'No user found for that email.';
        case 'wrong-password':
          return 'Wrong password provided.';
        default:
          return 'An unknown error occurred. Please try again later.';
      }
    }
    return error.toString();
  }

  // Retrieve users from Firestore
  List<DocumentSnapshot> usersList = [];

  void getUsers() {
    emit(AppGetUsersLoadingState());  // Emit a specific loading state for fetching users

    FirebaseFirestore.instance.collection('users').get().then((querySnapshot) {
      usersList = querySnapshot.docs;
      for (var doc in usersList) {
        log("User: ${doc['full_name']}, Email: ${doc['email']}");
      }
      emit(AppGetUsersSuccessState(usersList));  // Pass the user list on success
    }).catchError((error) {
      emit(AppGetUsersErrorState(error.toString()));
    });
  }
}
