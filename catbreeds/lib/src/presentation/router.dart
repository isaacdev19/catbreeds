import 'package:catbreeds/src/domain/entities/breed.dart';
import 'package:catbreeds/src/presentation/pages/detail_breed/detail_breed_page.dart';
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
      GoRoute(
        path: '/${DetailBreedPage.routeName}',
        name: DetailBreedPage.routeName,
        builder: (_, state) {
          final arguments = state.extra as Breed;

          return DetailBreedPage(breed: arguments);
        },
      ),
    ],
  );
}