import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaliti/auth/forgot_pass/cubit/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordStates> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());
  static ForgotPasswordCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> forgotPassFormKey = GlobalKey<FormState>();

  TextEditingController mailController = TextEditingController();

  resetPassword({required String email}) {
    emit(ForgotPasswordLoadingState());
    FirebaseAuth.instance
        .sendPasswordResetEmail(
      email: email,
    )
        .then((value) {
      emit(ForgotPasswordSuccessState());
    }).catchError((error) {
      emit(ForgotPasswordErrorState(error.toString()));
    });
  }
}
