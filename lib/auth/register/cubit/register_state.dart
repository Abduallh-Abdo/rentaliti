abstract class RegisterStates {}

final class RegisterInitial extends RegisterStates {}

final class RegisterChangePasswordVisibilityState extends RegisterStates {}

final class RegisterLoadingState extends RegisterStates {}

final class RegisterSuccessState extends RegisterStates {
  final String? fullName;
  final String? email;
  final String? password;

  RegisterSuccessState({this.fullName, this.email, this.password});
}

final class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterSaveUsersLodaingState extends RegisterStates {}

class RegisterSaveUsersSuccessState extends RegisterStates {}

class RegisterSaveUsersErrorState extends RegisterStates {
  final String error;
  RegisterSaveUsersErrorState(this.error);
}

class RegisterImagePickState extends RegisterStates {}