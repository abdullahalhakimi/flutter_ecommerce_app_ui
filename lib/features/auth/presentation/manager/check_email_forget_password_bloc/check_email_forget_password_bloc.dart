// ignore_for_file: void_checks

import 'package:bloc/bloc.dart';

part 'check_email_forget_password_event.dart';
part 'check_email_forget_password_state.dart';

class CheckEmailForgetPasswordBloc
    extends Bloc<CheckEmailForgetPasswordEvent, CheckEmailForgetPasswordState> {
  CheckEmailForgetPasswordBloc()
      : super(CheckEmailForgetPasswordState.initial()) {
    on<CheckEmailForgetPasswordEvent>((event, emit) async* {
      if (event is EmailChanged) {
        yield state.copyWith(
          email: event.email,
          isEmailValid: event.email.contains('@'), // Basic email validation
        );
      } else if (event is ForgotPasswordSubmitted) {
        yield state.copyWith(isSubmitting: true);
        // Simulate a network request
        await Future.delayed(
            const Duration(seconds: 2)); // Simulate network delay
        yield state.copyWith(isSubmitting: false, isSuccess: true);
      }
    });
  }
}
