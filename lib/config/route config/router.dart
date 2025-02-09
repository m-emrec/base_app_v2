import 'package:go_router/go_router.dart';

import '../../features/auth/data/services/auth_service.dart';
import 'auth_change_notifier.dart';
import 'redirectors/authentication_based_redirect.dart';
import 'routes/initial_route.dart';

/// The AppRouter class is responsible for managing the application's routing.
/// It listens to authentication state changes and updates the
/// routes accordingly.
final class AppRouter {
  /// When the AppRouter is instantiated, it starts listening to authentication
  ///  state changes.
  AppRouter() {
    AuthService().authStateChanges.listen((user) {
      _authChangeNotifier.notify();
    });
  }

  /// Getter for the GoRouter instance.
  GoRouter get router => _router;

  /// An instance of AuthChangeNotifier to listen for authentication changes.
  static final AuthChangeNotifier _authChangeNotifier = AuthChangeNotifier();

  /// The GoRouter instance that defines the application's routes and their
  /// configurations.
  static final GoRouter _router = GoRouter(
    refreshListenable: _authChangeNotifier,
    redirect: AuthenticationBasedRedirector().redirect,
    initialLocation: InitialRoute().route.path,
    routes: [
      // //* Home Page
      InitialRoute().route,

      ///
      /// .
      /// .
      /// .
      /// Add more routes here
    ],
  );
}
