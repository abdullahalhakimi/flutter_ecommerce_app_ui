import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/colors.dart';

import 'login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(backgroundColor: background),
        body: Padding(
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
                    ),
                    obscureText: true,
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
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                  if (state.isFailure) ...[
                    const SizedBox(height: 16),
                    const Text(
                      'Login Failed',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                  const SizedBox(height: 100),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Or login with social account",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.login),
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: () {
                                // Handle Facebook login
                              },
                              icon: const Icon(Icons.facebook,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ]),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
