import 'firebase_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

import '../../utils/constants/firebase/cloud_function_names.dart';
import '../../utils/constants/firebase/user_doc_enum.dart';

/// A mixin that provides Firebase Cloud Functions utilities.
///
///
/// This mixin includes methods that interact with Firebase Cloud Functions.
mixin FirebaseCloudFunctionsUtils on FirebaseUtils {
  /// return the success status of the response.
  ///
  /// This function returns a [bool] value that indicates if the response was successful.
  ///
  bool getResponseSuccess(HttpsCallableResult<Map<String, dynamic>> response) =>
      response.data['success'].toString().toLowerCase() == 'true';

  /// Get the error code from the response.
  ///
  /// This function returns the error code from the given response.
  ///
  ///
  String getErrorCode(HttpsCallableResult<Map<String, dynamic>> response) =>
      response.data['error']["errorInfo"]["code"].toString().split('/').last;

  /// Create a new user with a phone number.
  ///
  /// This function is provided by the Firebase Cloud Function `createUserWithPhoneNumber`.
  ///
  /// It creates a new user on FirebaseAuth with the provided phone number.
  ///
  /// The function returns a [HttpsCallableResult] which contains the result of the function.
  ///
  /// The result is a [Map] with the following keys:
  /// - `success` - A [bool] value that indicates if the function was successful.
  /// - `error` - A [String] message that contains the error message.
  Future<HttpsCallableResult<Map<String, dynamic>>> createUserWithPhoneNumber({
    required Map<String, dynamic> user,
  }) {
    final Map<String, dynamic> modifiedUserMap = user.map((key, val) {
      if (key == UserDocEnum.membershipEndDate.name ||
          key == UserDocEnum.membershipStartDate.name) {
        val as Timestamp;
        return MapEntry(key, val.millisecondsSinceEpoch);
      }
      return MapEntry(key, val);
    });

    return functions
        .httpsCallable(
          CloudFunctionNames.createUserWithPhoneNumber.name,
        )
        .call(modifiedUserMap);
  }
}
