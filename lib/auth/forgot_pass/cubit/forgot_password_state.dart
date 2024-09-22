
abstract class ForgotPasswordStates {}

final class ForgotPasswordInitial extends ForgotPasswordStates {}
final class ForgotPasswordLoadingState extends ForgotPasswordStates {}
final class ForgotPasswordSuccessState extends ForgotPasswordStates {}
final class ForgotPasswordErrorState extends ForgotPasswordStates {
  final String error;
  ForgotPasswordErrorState( this.error);
}



