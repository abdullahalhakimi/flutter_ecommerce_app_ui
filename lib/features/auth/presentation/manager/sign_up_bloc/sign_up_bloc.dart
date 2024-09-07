import 'package:bloc/bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState.initial()) {
    // ignore: void_checks
    on<SignUpEvent>((event, emit) async* {
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
          isPasswordValid:
              event.password.length >= 6, // Basic password validation
        );
      } else if (event is SignUpSubmitted) {
        yield state.copyWith(isSubmitting: true);
        // Simulate a network request or sign-up logic here
        await Future.delayed(
            const Duration(seconds: 2)); // Simulate network delay
        yield state.copyWith(isSubmitting: false, isSuccess: true);
      }
    });
  }
}
