import 'package:catbreeds/src/presentation/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/${HomePage.routeName}',
    routes: [
      GoRoute(
        path: '/${HomePage.routeName}',
        name: HomePage.routeName,
        builder: (_, __) => const HomePage(),
      ),
    ],
  );
}