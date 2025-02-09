import 'package:uuid/uuid.dart';

/// This class generates unique ids using the phone number of the user.
final class IDGenerator {
  /// Generates a unique id using the phone number of the user.
  static String generateId(
    String phoneNumber,
  ) {
    return const Uuid().v5(Namespace.oid.value, phoneNumber);
  }
}
