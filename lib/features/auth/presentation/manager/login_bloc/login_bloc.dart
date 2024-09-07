// ignore_for_file: void_checks

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    bool isEmailValid(String email) {
      return email.contains('@');
    }

    bool isPasswordValid(String password) {
      return password.length > 6;
    }

    Stream<LoginState> mapLoginSubmittedToState() async* {
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

    on<LoginEvent>((event, emit) async* {
      if (event is EmailChanged) {
        yield state.copyWith(
          email: event.email,
          isEmailValid: isEmailValid(event.email),
        );
      } else if (event is PasswordChanged) {
        yield state.copyWith(
          password: event.password,
          isPasswordValid: isPasswordValid(event.password),
        );
      } else if (event is LoginSubmitted) {
        yield* mapLoginSubmittedToState();
      }
    });
  }
}
