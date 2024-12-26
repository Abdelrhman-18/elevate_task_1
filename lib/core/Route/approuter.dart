import "package:elevate_task/features/Home/Ui/Screen/HomeScreen.dart";
import "package:go_router/go_router.dart";

class ConstantRouter {
  static const String homePath = "/home";
}

class AppRouter {
  static final GoRouter router =
      GoRouter(initialLocation: ConstantRouter.homePath, routes: [
    /// Route from home screen
    GoRoute(
      path: ConstantRouter.homePath,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ]);
}
