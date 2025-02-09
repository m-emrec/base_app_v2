// ignore_for_file: constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// A class that holds constant values used throughout the application.
class ConstantValues {
  ConstantValues._();

  /// The timeout duration for Firebase phone authentication.
  ///
  /// This is set to 120 seconds.
  static const Duration FIREBASE_PHONE_AUTH_TIMEOUT = Duration(seconds: 120);

  /// The phone code for Turkey.
  static const String PHONE_CODE = "+90";

  /// The maximum number of images that can be uploaded on the feedback screen.
  ///
  /// This is set to 3.
  static const int MAX_IMAGE_FEEDBACK_COUNT = 3;

  /// Warning threshold for membership end date.
  /// If the membership end date is less than this value, a warning will be displayed.
  /// This is set to 14 days.
  ///
  static const int MEMBERSHIP_EXPIRE_WARNING_THRESHOLD = 14;

  /// The minimum length of the feedback content.
  ///
  /// **This is set to 50**.
  ///
  /// The user must enter at least 50 characters.
  /// This is to ensure that the feedback is detailed and informative.
  static const int MIN_FEEDBACK_LENGTH = 50;

  /// The maximum length of the feedback content.
  ///
  /// **This is set to 1000**.
  ///
  /// The user must enter at most 1000 characters.
  /// This is to ensure that the feedback is not too long.
  static const int MAX_FEEDBACK_LENGTH = 1000;

  /// membershipWarning method checks if the membership end date is less than the warning threshold.
  ///
  /// If the difference between the current date and the membership end date is less than the threshold,
  /// it returns true.
  static bool isMembershipExpiringSoon(DateTime date) {
    final now = DateTime.now();

    final diff = date.difference(now).inDays;

    return diff < MEMBERSHIP_EXPIRE_WARNING_THRESHOLD;
  }

  /// DateTime formatter for the application.
  /// Formats the date in the format " dd MMM yyyy".
  /// Locale is set to the current locale of the application.
  ///  **Example Output**: `01 Jan 2022`.
  static String formattedDate(BuildContext context, DateTime date) {
    return DateFormat.yMMMd(
      context.locale.toString(),
    ).format(date);
  }

  static const Map<String, dynamic> phoneCodes = {
    "AF": "+93",
    "AL": "+355",
    "DZ": "+213",
    "AD": "+376",
    "AO": "+244",
    "AR": "+54",
    "AM": "+374",
    "AU": "+61",
    "AT": "+43",
    "AZ": "+994",
    "BH": "+973",
    "BD": "+880",
    "BY": "+375",
    "BE": "+32",
    "BZ": "+501",
    "BJ": "+229",
    "BT": "+975",
    "BO": "+591",
    "BA": "+387",
    "BW": "+267",
    "BR": "+55",
    "BN": "+673",
    "BG": "+359",
    "BF": "+226",
    "BI": "+257",
    "KH": "+855",
    "CM": "+237",
    "CA": "+1",
    "CV": "+238",
    "TD": "+235",
    "CL": "+56",
    "CN": "+86",
    "CO": "+57",
    "KM": "+269",
    "CR": "+506",
    "HR": "+385",
    "CU": "+53",
    "CY": "+357",
    "CZ": "+420",
    "DK": "+45",
    "EG": "+20",
    "FR": "+33",
    "DE": "+49",
    "GR": "+30",
    "IN": "+91",
    "ID": "+62",
    "IR": "+98",
    "IQ": "+964",
    "IE": "+353",
    "IL": "+972",
    "IT": "+39",
    "JP": "+81",
    "JO": "+962",
    "KZ": "+7",
    "KE": "+254",
    "KW": "+965",
    "LB": "+961",
    "LY": "+218",
    "LU": "+352",
    "MY": "+60",
    "MX": "+52",
    "MA": "+212",
    "NP": "+977",
    "NL": "+31",
    "NZ": "+64",
    "NG": "+234",
    "PK": "+92",
    "PH": "+63",
    "PL": "+48",
    "PT": "+351",
    "QA": "+974",
    "RO": "+40",
    "RU": "+7",
    "SA": "+966",
    "ZA": "+27",
    "ES": "+34",
    "SE": "+46",
    "CH": "+41",
    "TR": "+90",
    "UA": "+380",
    "AE": "+971",
    "GB": "+44",
    "US": "+1",
    "VN": "+84"
  };
}
