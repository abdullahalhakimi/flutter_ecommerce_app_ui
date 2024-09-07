import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_colors.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_styles.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.onChanged,
    required this.labelText,
    required this.errorText,
    required this.controller, this.suffixIcon,
  });
  final Function(String)? onChanged;
  final String labelText, errorText;

  final TextEditingController controller;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.dark, borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          style: AppStyle.styleRegular14(context)
              .copyWith(color: AppColors.whiteColor),
          decoration: InputDecoration(
              suffix: suffixIcon ?? const SizedBox(),
              filled: true,
              fillColor: AppColors.dark,
              alignLabelWithHint: true,
              labelText: labelText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              errorText: errorText,
              labelStyle: AppStyle.styleRegular14(context)
                  .copyWith(color: AppColors.gray),
              hintStyle: AppStyle.styleRegular14(context)
                  .copyWith(color: AppColors.whiteColor),
              border: textFormBorder(),
              disabledBorder: textFormBorder(),
              enabledBorder: textFormBorder(),
              focusedBorder: textFormBorder()),
        ),
      ),
    );
  }

  OutlineInputBorder textFormBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
