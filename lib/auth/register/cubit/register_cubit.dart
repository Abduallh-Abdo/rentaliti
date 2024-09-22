import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaliti/auth/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }
void userSignUp({
  required String name,
  required String email,
  required String password,
}) {
  emit(RegisterLoadingState());
  
  // Assuming you're using Firebase for authentication (or any other API)
  // Replace this part with your actual registration logic
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((value) {
    emit(RegisterSuccessState());  // Emit success on registration success
  }).catchError((error) {
    emit(RegisterErrorState(error.toString()));  // Emit error state on failure
  });
}

}
