import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_colors.dart';
import 'package:go_router/go_router.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 40),
      child: Container(
        color: AppColors.background,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.whiteColor,
                  size: 20,
                ))
          ],
        ),
      ),
    );
  }
}
