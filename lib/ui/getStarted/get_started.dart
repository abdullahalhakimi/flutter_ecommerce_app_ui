import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'get_started_bloc.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetStartedBloc()..add(LoadGetStarted()),
      child: Scaffold(
        backgroundColor: background, // Dark background color
        body: BlocBuilder<GetStartedBloc, GetStartedState>(
          builder: (context, state) {
            if (state is SuccessLoaded) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/images/bags.svg",
                            width: 150.0,
                            height: 150.0,
                          ),
                          const SizedBox(height: 30.0),
                          const Text(
            "We have more than 1000 products, \n Browse and choose your product now",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigation logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary, // Red button color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        minimumSize: (const Size(450, 50)),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
