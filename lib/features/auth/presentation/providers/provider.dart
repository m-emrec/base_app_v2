import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../../data/services/auth_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/sign_in_with_email_and_password_use_case.dart';
import 'auth_view_model.dart';

/// Dependency Injection
final _authServiceProvider = Provider.autoDispose<AuthService>((ref) {
  return AuthService();
});

final _authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  return AuthRepositoryImpl(authService: ref.read(_authServiceProvider));
});

final _signInWithEmailAndPasswordProvider =
    Provider<SignInWithEmailAndPasswordUseCase>((ref) {
  return SignInWithEmailAndPasswordUseCase(
    ref.read(_authRepositoryProvider),
  );
});

/// ViewModel
final authViewModelProvider =
    ChangeNotifierProvider.autoDispose<AuthViewModel>((ref) {
  return AuthViewModel(
    signInWithEmailAndPasswordUseCase:
        ref.read(_signInWithEmailAndPasswordProvider),
  );
});
