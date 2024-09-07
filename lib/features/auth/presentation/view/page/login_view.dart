import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_colors.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/view/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      body: LoginViewBody(),
    );
  }
}
