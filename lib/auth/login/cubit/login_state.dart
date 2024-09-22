abstract class LoginStates {}

final class LoginInitial extends LoginStates {}

final class LoginChangePasswordVisibilityState extends LoginStates {}

final class LoginLoadingState extends LoginStates {}

final class LoginSuccessState extends LoginStates {}

final class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState({required this.error});

}
