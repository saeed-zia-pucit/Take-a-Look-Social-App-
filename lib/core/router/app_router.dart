
part of 'router.dart';

sealed class RouteNames {
  static const splash = '/';
  static const home = '/home';
  static const onBoard = '/onBoard';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const forget = '/forget';
  static const verify = '/verify';
  static const changePsw = '/changePsw';
  static const congrats = '/congrats';
  static const location = '/location';
  static const profileSetupEdit = '/profileSetupEdit';
  static const profile = '/profile';
  static const miscellaneous = '/miscellaneous';
  static const aboutTermPrivacy = '/aboutTermPrivacy';
  // static const navBar = '/nav_bar';
  // static const detail = '/detail';
  // static const tasks = '/tasks';
  // static const taskDetail = '/tasks_detail';
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: RouteNames.onBoard,
      builder: (context, state) {
        return const OnBoardingPage();
      },
    ),
    GoRoute(
      path: RouteNames.signIn,
      builder: (context, state) {
        return const SignInPage();
      },
    ),
    GoRoute(
      path: RouteNames.forget,
      builder: (context, state) {
        return const ForgetPage();
      },
    ),
    GoRoute(
      path: RouteNames.verify,
      builder: (context, state) {
        return const VerifyPage();
      },
    ),
    GoRoute(
      path: RouteNames.changePsw,
      builder: (context, state) {
        return const ChangePswPage();
      },
    ),
    GoRoute(
      path: RouteNames.congrats,
      builder: (context, state) {
        return const CongratsPage();
      },
    ),
    GoRoute(
      path: RouteNames.location,
      builder: (context, state) {
        return const EnableLocationPage();
      },
    ),
    GoRoute(
      path: RouteNames.signUp,
      builder: (context, state) {
        return const SignUpPage();
      },
    ),
    GoRoute(
      path: RouteNames.profileSetupEdit,
      builder: (context, state) {
        ProfileType profileType = state.extra as ProfileType;
        return SetupEditProfilePage(
          profileType: profileType,
        );
      },
    ),
    GoRoute(
      path: RouteNames.profile,
      builder: (context, state) {
        return const ProfilePage();
      },
    ),
    GoRoute(
      path: RouteNames.miscellaneous,
      builder: (context, state) {
        return const MiscellaneousPage();
      },
    ),
    GoRoute(
      path: RouteNames.aboutTermPrivacy,
      builder: (context, state) {
        AboutTermPrivacyType aboutTermPrivacyType = state.extra as AboutTermPrivacyType;
        return AboutTermPrivacy(
          aboutTermPrivacyType: aboutTermPrivacyType,
        );
      },
    ),
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) {
        return const HomePage();
      },
    ),
    // ShellRoute(
    //   builder: (context, state, child) {
    //     return NavBarPage(child: child);
    //   },
    //   routes: [
    //     GoRoute(
    //       path: RouteNames.home,
    //       builder: (context, state) {
    //         return const HomePage();
    //       },
    //     ),
    //     GoRoute(
    //       path: RouteNames.tasks,
    //       builder: (BuildContext context, GoRouterState state) {
    //         return const TasksPage();
    //       },
    //     ),
    //     GoRoute(
    //       path: RouteNames.taskDetail,
    //       builder: (BuildContext context, GoRouterState state) {
    //         final task = state.extra as TaskModel;
    //         return TaskDetailsPage(taskModel: task,);
    //       },
    //     ),
    //   ],
    // ),
  ],
);