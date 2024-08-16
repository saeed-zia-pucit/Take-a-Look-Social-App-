part of 'router.dart';

sealed class RouteNames {
  static const splash = '/';
  static const homeFeed = '/home_feed';
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
  static const eLearning = '/eLearning';
  static const followLinks = '/followLinks';
  static const colorTheory = '/colorTheory';
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
        final email = state.extra;
        return VerifyPage(email: email);
      },
    ),
    GoRoute(
      path: RouteNames.changePsw,
      builder: (context, state) {
        final token_email = state.extra;
        return ChangePswPage(token_email: token_email);
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
        Map<String, dynamic> extras = state.extra as Map<String, dynamic>;
        ProfilePageType profilePageType = extras['pageType'];
        String userId = extras['userId'];
        return ProfilePage(
          profilePageType: profilePageType,
          userId: userId,
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
        AboutTermPrivacyType aboutTermPrivacyType =
            state.extra as AboutTermPrivacyType;
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
      path: RouteNames.followLinks,
      builder: (context, state) {
        return const FollowLinks();
      },
    ),
    GoRoute(
      path: RouteNames.colorTheory,
      builder: (context, state) {
        return const ColorTheory();
      },
    ),
    GoRoute(
      path: RouteNames.eLearning,
      builder: (context, state) {
        return const ELearning();
      },
    ),

    GoRoute(
      path: RouteNames.addNote,
      builder: (context, state) {
        AddNotePageType addNotePageType = state.extra as AddNotePageType;
        return AddNotePage(
          addNotePageType: addNotePageType,
        );
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
        List<ColorModel> colors = state.extra as List<ColorModel>;
        return HairFormula(
          colors: colors,
        );
      },
    ),
    GoRoute(
      path: RouteNames.wishList,
      builder: (context, state) {
        var pageType = state.extra as WishListPageType;
        // return const WishListPage();
        return WishListPostPage(pageType: pageType);
      },
    ),
    GoRoute(
      path: RouteNames.followFollowing,
      builder: (context, state) {
        FollowPageType followPageType = state.extra as FollowPageType;
        return FollowPage(followPageType: followPageType);
      },
    ),
    GoRoute(
      path: RouteNames.homeFeed,
      builder: (context, state) {
        var homeFeedPageType = state.extra as HomeFeedPageType;
        return HomeFeedPage(
          homeFeedPageType: homeFeedPageType,
        );
      },
    ),
    /* GoRoute(
      path: RouteNames.comments,
      builder: (context, state) {
        CommentLikesPageType commentLikesPageType = state.extra as CommentLikesPageType;
        return CommentLikesPage(
          commentLikesPageType: commentLikesPageType,
        );
      },
    ),*/
  ],
);
