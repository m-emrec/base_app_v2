import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/pages/sign_in_page.dart';
import '../redirectors/authentication_based_redirect.dart';
import 'base_route_class.dart';

/// The sign-in route.
/// This route is used to navigate to the sign-in screen.
/// It is a child route of the initial route.
/// If the user is authenticated, they will be redirected to the appropriate route.
/// If the user is not authenticated, they will be redirected to the sign-in page.
final class SignInRoute extends BaseRouteClass {
  /// The sign-in route.
  factory SignInRoute() => _instance;

  SignInRoute._internal();

  static final SignInRoute _instance = SignInRoute._internal();

  @override
  GoRoute get route => GoRoute(
        redirect: AuthenticationBasedRedirector().redirect,
        name: "signIn",
        path: "/sign-in",
        builder: (context, state) => const SignIn(),
      );

  @override
  String get name => "signIn";

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => const SignIn();

  @override
  String get path => "/sign-in";
}
