import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_colors.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.btnText,
  });

  final Function()? onPressed;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary, // Red button color
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        minimumSize: (const Size(450, 50)),
      ),
      child: Text(
        btnText,
        style: AppStyle.styleRegular14(context)
            .copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}
