part of 'check_email_forget_password_bloc.dart';



// Events
abstract class CheckEmailForgetPasswordEvent {}

class EmailChanged extends CheckEmailForgetPasswordEvent {
  final String email;
  EmailChanged(this.email);
}

class ForgotPasswordSubmitted extends CheckEmailForgetPasswordEvent {}