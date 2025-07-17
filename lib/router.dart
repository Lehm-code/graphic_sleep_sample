import 'package:go_router/go_router.dart';
import 'pages/main_home.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MainHomePage()),
  ],
);
