import 'package:easy_localization/easy_localization.dart';

import '../../../../config/localization/lang/locale_keys.g.dart';

enum Gender {
  female,
  male,
  ;

  /// Returns the localized text for genders.
  String get localizedText {
    switch (this) {
      case Gender.female:
        return tr(LocaleKeys.common_gender, gender: "female");
      case Gender.male:
        return tr(LocaleKeys.common_gender, gender: "male");
    }
  }
}

/// This extension written on String class to convert localized text
///
///
extension GenderStringExtension on String {
  /// This method converts  the localized gender text to [Gender] enum.
  ///
  /// **Example**
  /// ```dart
  ///
  ///   final String receivedGender = "Female" // "Kadın" in Turkish;
  ///
  ///   final Gender userGender = receivedGender.fromLocalizedStringToGenderEnum();
  ///
  ///   print(userGender)
  ///
  ///   // Output:
  ///   Gender.female
  ///
  ///
  /// ```
  ///
  ///
  Gender? fromLocalizedStringToGenderEnum() {
    if (this == Gender.female.localizedText) {
      return Gender.female;
    }
    if (this == Gender.male.localizedText) {
      return Gender.male;
    }
    return null;
  }
}
