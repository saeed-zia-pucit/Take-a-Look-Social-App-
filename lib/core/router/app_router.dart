
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
  static const settings = '/settings';
  static const note = '/note';
  static const addNote = '/addNote';
  static const notification = '/notification';
  static const hairColor = '/hairColor';
  static const hairFormula = '/hairFormula';
  static const wishList = '/wishList';
  static const followFollowing = '/followFollowing';
  static const comments = '/comments';

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
        SetupEditProfileType profileType = state.extra as SetupEditProfileType;
        return SetupEditProfilePage(
          profileType: profileType,
        );
      },
    ),
    GoRoute(
      path: RouteNames.profile,
      builder: (context, state) {
        ProfilePageType profilePageType = state.extra as ProfilePageType;
        return ProfilePage(
          profilePageType: profilePageType,
        );
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
      path: RouteNames.settings,
      builder: (context, state) {
        return const SettingsPage();
      },
    ),
    GoRoute(
      path: RouteNames.note,
      builder: (context, state) {
        return const NotePage();
      },
    ),
    GoRoute(
      path: RouteNames.addNote,
      builder: (context, state) {
        return const AddNotePage();
      },
    ),
    GoRoute(
      path: RouteNames.notification,
      builder: (context, state) {
        return const NotificationPage();
      },
    ),
    GoRoute(
      path: RouteNames.hairColor,
      builder: (context, state) {
        return const HairColorPage();
      },
    ),
    GoRoute(
      path: RouteNames.hairFormula,
      builder: (context, state) {
        List<Color> colors = state.extra as List<Color>;
        return HairFormula(
          colors: colors,
        );
      },
    ),
    GoRoute(
      path: RouteNames.wishList,
      builder: (context, state) {
        return const WishListPage();
      },
    ),
    GoRoute(
      path: RouteNames.followFollowing,
      builder: (context, state) {
        FollowFollowingPageType followFollowingPageType = state.extra as FollowFollowingPageType;
        return FollowFollowingPage(followFollowingPageType: followFollowingPageType);
      },
    ),
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: RouteNames.comments,
      builder: (context, state) {
        CommentLikesPageType commentLikesPageType = state.extra as CommentLikesPageType;
        return CommentLikesPage(
          commentLikesPageType: commentLikesPageType,
        );
      },
    ),
  ],
);