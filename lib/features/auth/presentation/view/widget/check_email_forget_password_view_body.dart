import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_colors.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_styles.dart';
import 'package:flutter_ecommerce_app_ui/core/widget/custom_auth_app_bar.dart';
import 'package:flutter_ecommerce_app_ui/core/widget/custom_button.dart';
import 'package:flutter_ecommerce_app_ui/core/widget/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/manager/check_email_forget_password_bloc/check_email_forget_password_bloc.dart';

class CheckEmailForgetPasswordBody extends StatefulWidget {
  const CheckEmailForgetPasswordBody({super.key});

  @override
  State<CheckEmailForgetPasswordBody> createState() =>
      _CheckEmailForgetPasswordBodyState();
}

class _CheckEmailForgetPasswordBodyState
    extends State<CheckEmailForgetPasswordBody> {
  late TextEditingController email;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    email = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
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
            child: BlocBuilder<CheckEmailForgetPasswordBloc,
                CheckEmailForgetPasswordState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Forgot password",
                            style: AppStyle.styleBold28(context),
                          ),
                          const SizedBox(height: 70),
                          Text(
                            "Please, enter your email address. You will receive a link to create a new password via email.",
                            style: AppStyle.styleBold14(context)
                                .copyWith(color: AppColors.whiteColor),
                          ),
                          const SizedBox(height: 16),
                          CustomTextFormFiled(
                              onChanged: (value) => context
                                  .read<CheckEmailForgetPasswordBloc>()
                                  .add(EmailChanged(value)),
                              // suffixIcon: !state.isEmailValid
                              //                           ? const Icon(Icons.close, color: Colors.red)
                              //                           : null,
                              labelText: "Email",
                              errorText: "",
                              controller: email),
                          const SizedBox(height: 5),
                          Text(
                            state.isEmailValid
                                ? "Not a valid email address. Should be your@email.com"
                                : "",
                            style: AppStyle.styleRegular14(context)
                                .copyWith(color: AppColors.error),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40),
                          state.isSubmitting
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  btnText: "SEND",
                                  onPressed: () {
                                    // context.go(AppRoutes.ketStarted);
                                    // context
                                    //     .read<CheckEmailForgetPasswordBloc>()
                                    //     .add(ForgotPasswordSubmitted());
                                  },
                                )
                        ],
                      )),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
