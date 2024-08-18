import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_ui/ui/getStarted/get_started.dart';
import 'package:flutter_ecommerce_app_ui/ui/home/home_screen.dart';
import 'package:flutter_ecommerce_app_ui/ui/login/login_screen.dart';
import 'package:flutter_ecommerce_app_ui/ui/singup/singup_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const loginScreen = "/loginScreen";
  static const singUpScreen = "/singUpScreen";
  static const homeScreen = "/homeScreen";
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
              return const SingUpScreen();
            },
          ),
          GoRoute(
            path: 'loginScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
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
          GoRoute(
            path: 'homeScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
        ],
      ),
    ],
  );
}
