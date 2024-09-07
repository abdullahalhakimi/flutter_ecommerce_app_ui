import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_colors.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/view/widget/signup_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: true,
      body: SignUpViewBody(),
    );
  }
}
