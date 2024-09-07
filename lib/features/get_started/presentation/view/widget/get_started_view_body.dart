import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_assets.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_colors.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_routes.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_styles.dart';
import 'package:flutter_ecommerce_app_ui/core/widget/custom_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                Assets.imagesBags,
                fit: BoxFit.scaleDown,
                width: 150.0,
                height: 150.0,
              ),
              const SizedBox(height: 40.0),
              Text(
                "We have more than 1000 products, \n Browse and choose your product now",
                style: AppStyle.styleBold14(context).copyWith(
                  fontSize: 16.0,
                  color: AppColors.whiteColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomButton(
              btnText: 'Get Started',
              onPressed: () {
                context.go(AppRoutes.kSingUpView);
              },
            )),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
