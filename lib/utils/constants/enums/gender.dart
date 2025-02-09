import 'package:easy_localization/easy_localization.dart';

import '../../../config/localization/lang/locale_keys.g.dart';

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

/// An extension that provides utility methods for the [String] class.
extension GenderStringExtension on String {
  /// Converts localized text to Gender enum.
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
