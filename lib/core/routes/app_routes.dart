import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_ui/ui/getStarted/get_started.dart';
import 'package:flutter_ecommerce_app_ui/ui/login/login_screen.dart';
import 'package:flutter_ecommerce_app_ui/ui/singup/singup_screen.dart';
import 'package:go_router/go_router.dart';

import '../../ui/forgotPassword/forgot_password_screen.dart';
import '../../ui/mainScreen/main_screen.dart';

abstract class AppRoutes {
  static const getStarted = "/";
  static const loginScreen = "/loginScreen";
  static const singUpScreen = "/singUpScreen";
  static const forgotPasswordScreen = "/forgotPasswordScreen";
  static const mainScreen = "/mainScreen";
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const GetStartedScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'singUpScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpScreen();
            },
          ),
          GoRoute(
            path: 'loginScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
            path: 'forgotPasswordScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const ForgotPasswordScreen();
            },
          ),
          GoRoute(
            path: 'mainScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const MainScreen();
            },
          ),
          GoRoute(
            path: 'mainScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const MainScreen();
            },
          ),
          // GoRoute(
          //   path: 'singUpScreen',
          //   builder: (BuildContext context, GoRouterState state) {
          //     return  BlocProvider(
          //       create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          //       child:  BookDetailsView(
          //         bookModel: state.extra as BookModel,
          //       ),
          //     );
          //   },
          // ), //Will use later
        ],
      ),
    ],
  );
}
