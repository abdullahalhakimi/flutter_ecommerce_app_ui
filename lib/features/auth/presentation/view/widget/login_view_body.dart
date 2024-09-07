import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_routes.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_styles.dart';
import 'package:flutter_ecommerce_app_ui/core/widget/custom_auth_app_bar.dart';
import 'package:flutter_ecommerce_app_ui/core/widget/custom_button.dart';
import 'package:flutter_ecommerce_app_ui/core/widget/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app_ui/core/widget/singup_options.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/view/widget/forget_password_button.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late TextEditingController email, password;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAuthAppBar(),
        const SizedBox(height: 10.0),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: AppStyle.styleBold28(context),
                        ),
                        const SizedBox(height: 73.0),
                        CustomTextFormFiled(
                          onChanged: (value) => context
                              .read<LoginBloc>()
                              .add(EmailChanged(value)),
                          controller: email,
                          labelText: "Email",
                          errorText: state.isEmailValid ? "" : 'Invalid Email',
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormFiled(
                          onChanged: (value) => context
                              .read<LoginBloc>()
                              .add(PasswordChanged(value)),
                          controller: password,
                          labelText: "Password",
                          errorText:
                              state.isPasswordValid ? "" : 'Invalid Password',
                        ),
                        const SizedBox(height: 5),
                        ForgetPasswordButton(
                          text: "Forgot your password?",
                          onPressed: () {
                            context
                                .push(AppRoutes.kCheckEmailForgetPasswordView);
                          },
                        ),
                        const SizedBox(height: 30),
                        state.isSubmitting
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                btnText: "LOGIN",
                                onPressed: () {
                                  context.go(AppRoutes.mainScreen);
                                  context
                                      .read<LoginBloc>()
                                      .add(LoginSubmitted());
                                },
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
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
