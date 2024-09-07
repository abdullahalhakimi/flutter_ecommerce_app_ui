import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/manager/check_email_forget_password_bloc/check_email_forget_password_bloc.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/manager/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/view/page/check_email_forget_password_view.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/view/page/login_view.dart';
import 'package:flutter_ecommerce_app_ui/features/auth/presentation/view/page/signup_view.dart';
import 'package:flutter_ecommerce_app_ui/features/get_started/presentation/view/page/get_started_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/mainScreen/main_screen.dart';

abstract class AppRoutes {
  static const kGetStarted = "/";
  static const kLoginView = "/loginView";
  static const kSingUpView = "/signUpView";
  static const kCheckEmailForgetPasswordView = "/checkEmailForgetPasswordView";
  static const mainScreen = "/mainScreen";
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const GetStartedView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'signUpView',
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider(
                create: (context) => SignUpBloc(),
                child: const SignUpView(),
              );
            },
          ),
          GoRoute(
            path: 'loginView',
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider(
                create: (context) => LoginBloc(),
                child: const LoginView(),
              );
            },
          ),
          GoRoute(
            path: 'checkEmailForgetPasswordView',
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider(
                create: (context) => CheckEmailForgetPasswordBloc(),
                child: const CheckEmailForgetPasswordView(),
              );
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
