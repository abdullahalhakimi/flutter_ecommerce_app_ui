import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app_ui/ui/component/singup_options.dart';
import 'package:flutter_ecommerce_app_ui/ui/singup/signup_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/routes/app_routes.dart';
import '../../utils/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Scaffold(
        backgroundColor: background,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(backgroundColor: background),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      onChanged: (value) =>
                          context.read<SignUpBloc>().add(NameChanged(value)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: dark,
                        labelText: 'Name',
                        labelStyle: const TextStyle(color: Colors.white),
                        // suffixIcon: state.isNameValid
                        //     ? const Icon(Icons.check, color: Colors.green)
                        //     : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (value) =>
                          context.read<SignUpBloc>().add(EmailChanged(value)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: dark,
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (value) => context
                          .read<SignUpBloc>()
                          .add(PasswordChanged(value)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: dark,
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      obscureText: true,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.go(AppRoutes.loginScreen);
                          },
                          child: const Text(
                            "Already have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_right_alt,
                          color: primary,
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    state.isSubmitting
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () {
                              context.go(AppRoutes.mainScreen);
                              context.read<SignUpBloc>().add(SignUpSubmitted());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text(
                              "SIGN UP",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                    const SizedBox(height: 150),
                    const SingUpOptions()
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
