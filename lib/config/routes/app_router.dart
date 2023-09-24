import 'package:dbms/src/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/dashboard/projects',
    builder: (context, state) => const DashboardScreen(),
  ),
  GoRoute(
    path: '/dashboard/project/unknown',
    builder: (context, state) => QueryScreen(),
  ),
]);
