import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/view/widget/check_email_forget_password_view_body.dart';

class CheckEmailForgetPasswordView extends StatelessWidget {
  const CheckEmailForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CheckEmailForgetPasswordBody(),
    );
  }
}
