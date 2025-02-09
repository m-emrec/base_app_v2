import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../config/localization/lang/locale_keys.g.dart';
import '../../../../product/widgets/custom_toast.dart';
import '../../data/models/auth_model.dart';
import '../../domain/usecases/sign_in_with_email_and_password_use_case.dart';

/// ViewModel for handling authentication-related operations.
///
/// This class extends [ChangeNotifier] to provide state management capabilities
class AuthViewModel extends ChangeNotifier {
  /// Creates an instance of [AuthViewModel].
  ///

  AuthViewModel({
    required SignInWithEmailAndPasswordUseCase
        signInWithEmailAndPasswordUseCase,
  })  : _signInWithEmailAndPasswordUseCase = signInWithEmailAndPasswordUseCase,
        super();

  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;

  /// Sign in with email and password.
  Future<void> signInWithEmailAndPassword(AuthModel credentials) async {
    await Toast.toastDataStateMessageWrapper(
      dataState: await _signInWithEmailAndPasswordUseCase(credentials),
      successMessage: LocaleKeys.auth_signin_successfullySignedIn.tr(),
    );
    notifyListeners();
  }
}
