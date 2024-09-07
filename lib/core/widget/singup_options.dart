import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_assets.dart';
import 'package:flutter_svg/svg.dart';

class SingUpOptions extends StatelessWidget {
  const SingUpOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "Or login with social account",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 90,
            height: 60,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(25.0), // Rounded corners
            ),
            child: SvgPicture.asset(
              Assets.imagesGoogle,
              fit: BoxFit.scaleDown,
              width: 24.0,
              height: 24.0,
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 90,
            height: 60,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(25.0), // Rounded corners
            ),
            child: SvgPicture.asset(
              Assets.imagesFacebook,
              fit: BoxFit.scaleDown,
              width: 24.0,
              height: 24.0,
            ),
          ),
        ],
      )
    ]);
  }
}
