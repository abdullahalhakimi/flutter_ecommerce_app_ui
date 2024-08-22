import 'package:flutter_bloc/flutter_bloc.dart';

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

// States
class SignUpState {
  final String name;
  final String email;
  final String password;
  final bool isNameValid;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  SignUpState({
    required this.name,
    required this.email,
    required this.password,
    required this.isNameValid,
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
  });

  factory SignUpState.initial() {
    return SignUpState(
      name: '',
      email: '',
      password: '',
      isNameValid: true,
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
    bool? isNameValid,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isNameValid: isNameValid ?? this.isNameValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}

// Bloc
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState.initial());

  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is NameChanged) {
      yield state.copyWith(
        name: event.name,
        isNameValid: event.name.isNotEmpty,
      );
    } else if (event is EmailChanged) {
      yield state.copyWith(
        email: event.email,
        isEmailValid: event.email.contains('@'), // Basic email validation
      );
    } else if (event is PasswordChanged) {
      yield state.copyWith(
        password: event.password,
        isPasswordValid: event.password.length >= 6, // Basic password validation
      );
    } else if (event is SignUpSubmitted) {
      yield state.copyWith(isSubmitting: true);
      // Simulate a network request or sign-up logic here
      await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
      yield state.copyWith(isSubmitting: false, isSuccess: true);
    }
  }
}
