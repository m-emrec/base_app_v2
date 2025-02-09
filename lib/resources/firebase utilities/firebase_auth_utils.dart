import '../../services/user_service.dart';
import 'firebase_utils.dart';

/// A mixin that provides utility methods for Firebase Auth.
/// This mixin extends the [FirebaseUtils] class and provides methods for
/// signing out the currently authenticated user.
mixin FirebaseAuthUtils on FirebaseUtils {
  /// Signs out the currently authenticated user.
  ///
  /// This method signs out the current user from Firebase Auth.
  Future<void> signOut() async {
    UserService().clear();
    return auth.signOut();
  }
}
