import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_routes.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_styles.dart';
import 'package:flutter_ecommerce_app_ui/core/widget/custom_auth_app_bar.dart';
import 'package:flutter_ecommerce_app_ui/core/widget/custom_button.dart';
import 'package:flutter_ecommerce_app_ui/core/widget/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app_ui/core/widget/singup_options.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/manager/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/view/widget/forget_password_button.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late TextEditingController email, password, name;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
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
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign up",
                            style: AppStyle.styleBold28(context),
                          ),
                          const SizedBox(height: 70),
                          CustomTextFormFiled(
                              onChanged: (value) => context
                                  .read<SignUpBloc>()
                                  .add(NameChanged(value)),
                              labelText: 'Name',
                              errorText: "",
                              controller: name),
                          const SizedBox(height: 16),
                          CustomTextFormFiled(
                              onChanged: (value) => context
                                  .read<SignUpBloc>()
                                  .add(EmailChanged(value)),
                              labelText: 'Email',
                              errorText: "",
                              controller: email),
                          const SizedBox(height: 16),
                          CustomTextFormFiled(
                              onChanged: (value) => context
                                  .read<SignUpBloc>()
                                  .add(PasswordChanged(value)),
                              labelText: 'Password',
                              errorText: "",
                              controller: password),
                          const SizedBox(height: 5),
                          ForgetPasswordButton(
                            text: "Already have an account?",
                            onPressed: () {
                              context.push(AppRoutes.kLoginView);
                            },
                          ),
                          const SizedBox(height: 40),
                          state.isSubmitting
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  btnText: "SIGN UP",
                                  onPressed: () {
                                    context.go(AppRoutes.mainScreen);
                                    context
                                        .read<SignUpBloc>()
                                        .add(SignUpSubmitted());
                                  },
                                ),
                          const SizedBox(height: 150),
                          const SingUpOptions()
                        ],
                      ),
                    ));
              },
            ),
          ),
        )
      ],
    );
  }
}
