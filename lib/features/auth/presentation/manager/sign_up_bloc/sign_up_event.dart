part of 'sign_up_bloc.dart';


// Events
abstract class SignUpEvent {}

class NameChanged extends SignUpEvent {
  final String name;
  NameChanged(this.name);
}

class EmailChanged extends SignUpEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends SignUpEvent {
  final String password;
  PasswordChanged(this.password);
}

class SignUpSubmitted extends SignUpEvent {}
