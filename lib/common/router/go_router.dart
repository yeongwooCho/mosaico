import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/ai/view/ai_screen.dart';
import 'package:mosaico/category/view/category_screen.dart';
import 'package:mosaico/common/view/completion_screen.dart';
import 'package:mosaico/common/view/error_screen.dart';
import 'package:mosaico/common/view/root_tab.dart';
import 'package:mosaico/common/view/splash_screen.dart';
import 'package:mosaico/event/view/event_detail_screen.dart';
import 'package:mosaico/event/view/event_of_like_screen.dart';
import 'package:mosaico/event/view/event_of_participation_screen.dart';
import 'package:mosaico/event/view/event_screen.dart';
import 'package:mosaico/event/view/participation_certification_screen.dart';
import 'package:mosaico/event/view/participation_term_screen.dart';
import 'package:mosaico/friend/view/friend_screen.dart';
import 'package:mosaico/notification/view/notification_detail_screen.dart';
import 'package:mosaico/notification/view/notification_screen.dart';
import 'package:mosaico/profile/view/edit_profile_screen.dart';
import 'package:mosaico/profile/view/profile_screen.dart';
import 'package:mosaico/user/view/certification_screen.dart';
import 'package:mosaico/user/view/custom_sns_screen.dart';
import 'package:mosaico/user/view/email_login_screen.dart';
import 'package:mosaico/user/view/input_info_screen.dart';
import 'package:mosaico/user/view/login_screen.dart';
import 'package:mosaico/user/view/term_detail_screen.dart';
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
        path: '/completion/:title',
        name: CompletionScreen.routeName,
        builder: (context, state) => CompletionScreen(),
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
                routes: [
                  GoRoute(
                    path: 'detail/:id',
                    name: TermDetailScreen.routeName,
                    builder: (context,state) => TermDetailScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'certification',
                name: CertificationScreen.routeName,
                builder: (context, state) => CertificationScreen(),
                routes: [
                  GoRoute(
                    path: 'input_info',
                    name: InputInfoScreen.routeName,
                    builder: (context, state) => InputInfoScreen(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return RootTab(child: child);
        },
        routes: [
          GoRoute(
            path: '/friend',
            name: FriendScreen.routeName,
            builder: (context, state) => FriendScreen(),
          ),
          GoRoute(
            path: '/event',
            name: EventScreen.routeName,
            builder: (context, state) => EventScreen(),
            routes: [
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: ':id',
                name: EventDetailScreen.routeName,
                builder: (context, state) => EventDetailScreen(
                  id: state.pathParameters['id']!,
                ),
              )
            ],
          ),
          GoRoute(
            path: '/profile',
            name: ProfileScreen.routeName,
            builder: (context, state) => ProfileScreen(),
            routes: [
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'edit',
                name: EditProfileScreen.routeName,
                builder: (context, state) => EditProfileScreen(),
              ),
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'participation',
                name: EventOfParticipationScreen.routeName,
                builder: (context, state) => EventOfParticipationScreen(),
              ),
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'like',
                name: EventOfLikeScreen.routeName,
                builder: (context, state) => EventOfLikeScreen(),
              ),
            ],
          ),
          GoRoute(
            path: '/ai',
            name: AiScreen.routeName,
            builder: (context, state) => AiScreen(),
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/category/:title',
        name: CategoryScreen.routeName,
        builder: (context, state) {
          final String title = state.pathParameters['title'] ?? '';

          return CategoryScreen(title: title);
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/notification',
        name: NotificationScreen.routeName,
        builder: (_, state) => NotificationScreen(),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: ':id',
            name: NotificationDetailScreen.routeName,
            builder: (_, state) => NotificationDetailScreen(
              id: state.pathParameters['id']!,
            ),
          )
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/participation_certification',
        name: ParticipationCertificationScreen.routeName,
        builder: (_, state) => ParticipationCertificationScreen(),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: 'term',
            name: ParticipationTermScreen.routeName,
            builder: (_, state) => ParticipationTermScreen(
            ),
          )
        ],
      ),
    ];
