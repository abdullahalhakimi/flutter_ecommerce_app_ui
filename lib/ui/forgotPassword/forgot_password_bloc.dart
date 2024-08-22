import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class ForgotPasswordEvent {}

class EmailChanged extends ForgotPasswordEvent {
  final String email;
  EmailChanged(this.email);
}

class ForgotPasswordSubmitted extends ForgotPasswordEvent {}

// States
class ForgotPasswordState {
  final String email;
  final bool isEmailValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  ForgotPasswordState({
    required this.email,
    required this.isEmailValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
  });

  factory ForgotPasswordState.initial() {
    return ForgotPasswordState(
      email: '',
      isEmailValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  ForgotPasswordState copyWith({
    String? email,
    bool? isEmailValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}

// Bloc
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordState.initial());

  Stream<ForgotPasswordState> mapEventToState(
      ForgotPasswordEvent event) async* {
    if (event is EmailChanged) {
      yield state.copyWith(
        email: event.email,
        isEmailValid: event.email.contains('@'), // Basic email validation
      );
    } else if (event is ForgotPasswordSubmitted) {
      yield state.copyWith(isSubmitting: true);
      // Simulate a network request
      await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
      yield state.copyWith(isSubmitting: false, isSuccess: true);
    }
  }
}
