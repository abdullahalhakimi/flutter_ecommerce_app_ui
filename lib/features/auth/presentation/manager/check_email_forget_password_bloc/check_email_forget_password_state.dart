part of 'check_email_forget_password_bloc.dart';



// States
class CheckEmailForgetPasswordState {
  final String email;
  final bool isEmailValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  CheckEmailForgetPasswordState({
    required this.email,
    required this.isEmailValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
  });

  factory CheckEmailForgetPasswordState.initial() {
    return CheckEmailForgetPasswordState(
      email: '',
      isEmailValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  CheckEmailForgetPasswordState copyWith({
    String? email,
    bool? isEmailValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return CheckEmailForgetPasswordState(
      email: email ?? this.email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}