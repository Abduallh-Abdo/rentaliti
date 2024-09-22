abstract class RegisterStates {}

final class RegisterInitial extends RegisterStates {}

final class RegisterChangePasswordVisibilityState extends RegisterStates {}

final class RegisterLoadingState extends RegisterStates {}

final class RegisterSuccessState extends RegisterStates {}

final class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}
