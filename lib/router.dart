import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/challenge/features/authentication/login_screen.dart';
import 'package:tiktok/challenge/features/authentication/repos/authentication.repo.dart';
import 'package:tiktok/challenge/features/authentication/sign_up_screen.dart';
import 'package:tiktok/challenge/features/main_navigation/c_activity_screen.dart';
import 'package:tiktok/challenge/features/main_navigation/c_main_navigation.dart';
import 'package:tiktok/challenge/features/main_navigation/c_search_screen.dart';
import 'package:tiktok/challenge/features/main_navigation/home_screen.dart';
import 'package:tiktok/challenge/features/profile/view/privacy_screen.dart';
import 'package:tiktok/features/users/user_profile_screen.dart';

// GoRouter도 Provider로 감싸면 Ref에 접근 가능
final routerProvider = Provider(
  (ref) {
    // router에 ref.watch 두면 자동으로 rebuild
    // ref.watch(authState);

    return GoRouter(
      initialLocation: '/home',
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggendIn;
        //state.subloc : subloc - user가 있는 location

        // 로그인 안돼있는데 /home에 있으면 "/" 로 리다이렉
        if (!isLoggedIn) {
          if (state.subloc != SignUpScreen.routeURL &&
              state.subloc != CLoginScreen.routeURL) {
            return CLoginScreen.routeURL;
          }
        }
        // 로그인 돼있으면 리다이렉트 실행 X
        return null;
      },
      routes: [
        // GoRoute(
        //   path: "/:tab(home|search|activity|settings)",
        //   name: CMainNavigation.routeName,
        //   builder: (context, state) {
        //     // final tab = state.params["tab"]!;
        //     return CMainNavigation(
        //       tab: 'home',
        //     );
        //   },
        // ),

        // GoRoute(
        //   path: '/',
        //   builder: (context, state) => PrivacyScreen(),
        // ),

        // GoRoute(
        //   path: '/',
        //   builder: (context, state) => const RiverpodStfExample(),
        // ),

        // GoRoute(
        //   path: '/',
        //   name: CMainNavigation.routeName,
        //   builder: (context, state) => CMainNavigation(
        //     tab: 'home',
        //   ),
        // ),

        GoRoute(
          path: CLoginScreen.routeURL,
          builder: (context, state) => const CLoginScreen(),
        ),
        GoRoute(
          path: SignUpScreen.routeURL,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: "/:tab(home|search|activity|profile|settings)",
          name: CMainNavigation.routeName,
          builder: (context, state) {
            final tab = state.params["tab"]!;
            // final tab = 'home';
            return CMainNavigation(tab: 'home');
          },
        ),
        GoRoute(
          path: PrivacyScreen.routeName,
          name: 'privacy',
          builder: (context, state) => const PrivacyScreen(),
        ),
        // GoRoute(
        //   // path: "/",
        //   path: CMainNavigation.routeName,
        //   builder: (context, state) => const CMainNavigation(),
        // ),
        // GoRoute(
        //   // path: "/",
        //   path: CActivityScreen.routeName,
        //   builder: (context, state) => const CActivityScreen(),
        // ),
        // GoRoute(
        //   // path: "/",
        //   path: CSearchScreen.routeName,
        //   builder: (context, state) => const CSearchScreen(),
        // ),
        // GoRoute(
        //   // path: "/",
        //   path: HomeScreen.routeName,
        //   builder: (context, state) => const HomeScreen(),
        // ),
        // GoRoute(
        //   // path: "/",
        //   path: ProfileScreen.routeName,
        //   builder: (context, state) => const ProfileScreen(),
        // ),
        // GoRoute(
        //   // path: "/",
        //   path: SettingsScreen.routeName,
        //   builder: (context, state) => const SettingsScreen(),
        // ),
        GoRoute(
          // path: "/",
          path: PrivacyScreen.routeName,
          builder: (context, state) => const PrivacyScreen(),
        ),
        GoRoute(
          path: "/users/:username",
          // transition 주는 방법 !
          // pageBuilder: (context, state) {
          //   return CustomTransitionPage(
          //     child: const UsernameScreen(),
          //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
          //       return FadeTransition(
          //         opacity: animation,
          //         child: ScaleTransition(
          //           scale: animation,
          //           child: child,
          //         ),
          //       );
          //     },
          //   );
          // },
          builder: (context, state) {
            final username = state.params['username'];

            //context.push에 extra에 담은것 출력 가능
            final ex = state.extra;

            return UserProfileScreen(
              username: username!,
              // a: ex; 이런식으로 전달
            );
          },
        )
      ],
    );
  },
);
