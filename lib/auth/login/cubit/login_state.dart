import 'package:cloud_firestore/cloud_firestore.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginChangePasswordVisibilityState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String email;
  final String uid;

  LoginSuccessState({required this.email, required this.uid});
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState({required this.error});
}

// States for user retrieval from Firestore
class AppGetUsersLoadingState extends LoginStates {}

class AppGetUsersSuccessState extends LoginStates {
  final List<DocumentSnapshot> users;
  
  AppGetUsersSuccessState(this.users);
}

class AppGetUsersErrorState extends LoginStates {
  final String error;

  AppGetUsersErrorState(this.error);
}
