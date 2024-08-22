import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/app_routes.dart';
import '../../utils/colors.dart';
import '../component/singup_options.dart';
import 'login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        backgroundColor: background,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(backgroundColor: background),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50.0),
                    TextField(
                      onChanged: (value) =>
                          context.read<LoginBloc>().add(EmailChanged(value)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: dark,
                        labelText: 'Email',
                        errorText: state.isEmailValid ? null : 'Invalid Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (value) =>
                          context.read<LoginBloc>().add(PasswordChanged(value)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: dark,
                        labelText: 'Password',
                        errorText:
                            state.isPasswordValid ? null : 'Invalid Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.go(AppRoutes.singUpScreen);
                          },
                          child: const Text(
                            "Forgot your password?",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_right_alt,
                          color: primary,
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    state.isSubmitting
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              context.read<LoginBloc>().add(LoginSubmitted());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primary, // Red button color
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              minimumSize: (const Size(450, 50)),
                            ),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(fontSize: 18,color: Colors.white),
                            ),
                          ),
                    if (state.isFailure) ...[
                      const SizedBox(height: 16),
                      const Text(
                        'Login Failed',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                    const SizedBox(height: 150),
                    const SingUpOptions(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}