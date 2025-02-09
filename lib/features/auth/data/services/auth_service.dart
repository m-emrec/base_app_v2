import 'dart:async';

import 'package:base_app_v2/core/resources/firebase%20utilities/firebase_utils.dart';

import '../../../../core/resources/firebase utilities/firebase_auth_utils.dart';
import '../../../../core/resources/firebase utilities/firestore_utils.dart';
import '../models/auth_model.dart';

/// A service class that handles authentication operations using Firebase.
class AuthService extends FirebaseUtils with FirebaseAuthUtils, FirestoreUtils {
  /// Singleton instance of [AuthService].
  factory AuthService() => _instance;
  AuthService._internal();
  static final AuthService _instance = AuthService._internal();

  /// Signs in a user with email and password.
  Future<void> signWithEmailAndPassword(
    AuthModel credentials,
  ) async {
    await auth.signInWithEmailAndPassword(
      email: credentials.email,
      password: credentials.password,
    );
  }
}
