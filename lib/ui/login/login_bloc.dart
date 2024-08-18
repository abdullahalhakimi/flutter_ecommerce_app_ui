
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginSubmitted extends LoginEvent {}

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  const LoginState({
    required this.email,
    required this.password,
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
  });

  bool get isFormValid => isEmailValid && isPasswordValid;

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    isEmailValid,
    isPasswordValid,
    isSubmitting,
    isSuccess,
    isFailure,
  ];
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield state.copyWith(
        email: event.email,
        isEmailValid: _isEmailValid(event.email),
      );
    } else if (event is PasswordChanged) {
      yield state.copyWith(
        password: event.password,
        isPasswordValid: _isPasswordValid(event.password),
      );
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState();
    }
  }

  Stream<LoginState> _mapLoginSubmittedToState() async* {
    if (state.isFormValid) {
      yield state.copyWith(isSubmitting: true);

      try {
        // Simulate login process
        await Future.delayed(const Duration(seconds: 5));
        yield state.copyWith(isSuccess: true);
      } catch (_) {
        yield state.copyWith(isFailure: true);
      } finally {
        yield state.copyWith(isSubmitting: false);
      }
    }
  }

  bool _isEmailValid(String email) {
    return email.contains('@');
  }

  bool _isPasswordValid(String password) {
    return password.length > 6;
  }
}

