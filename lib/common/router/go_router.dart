import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/view/error_screen.dart';
import 'package:mosaico/common/view/splash_screen.dart';
import 'package:mosaico/user/view/custom_sns_screen.dart';
import 'package:mosaico/user/view/email_login_screen.dart';
import 'package:mosaico/user/view/login_screen.dart';
import 'package:mosaico/user/view/term_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  redirect: null,
  initialLocation: '/splash',
  routes: routes,
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
  ),
  debugLogDiagnostics: true,
);

List<RouteBase> get routes => [
      GoRoute(
        path: '/splash',
        name: SplashScreen.routeName,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/sns/:title',
        name: CustomSnsScreen.routeName,
        builder: (context, state) => CustomSnsScreen(),
      ),
      GoRoute(
        path: '/login',
        name: LoginScreen.routeName,
        builder: (context, state) => LoginScreen(),
        routes: [
          GoRoute(
            path: 'email_login',
            name: EmailLoginScreen.routeName,
            builder: (context, state) => EmailLoginScreen(),
            routes: [
              GoRoute(
                path: 'term',
                name: TermScreen.routeName,
                builder: (context,state) => TermScreen(),
              ),
            ],
          )
        ],
      ),
    ];
