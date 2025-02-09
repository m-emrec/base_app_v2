# Localization Guide - Using LocaleKeys

This guide will help you understand how to use the **LocaleKeys** class for managing localization in **Base App v2**. The app uses **EasyLocalization** to handle multiple languages efficiently.

---

## 📌 Overview

The **LocaleKeys** file is automatically generated using EasyLocalization. It contains string keys used throughout the app for localized content.

### 📁 Directory Structure

```
config/
 ├── localization/
 │   ├── lang/
 │   │   ├── locale_keys.g.dart
 │   ├── localization_init.dart
```

---

## 🔧 Generating LocaleKeys

If you make changes to the translation files located in `assets/translations`, you need to regenerate the `locale_keys.g.dart` file using the following command:

```sh
flutter pub run easy_localization:generate --output-dir lib/config/localization/lang -f keys -o locale_keys.g.dart --source-dir assets/translations
```

This command scans the translation files and updates `locale_keys.g.dart` accordingly.

---

## 🌍 Adding a New Language

To add a new language to the app, you need to update `localization_init.dart`:

1. Open `localization_init.dart`.
2. Add the new locale to `supportedLocales`.
3. Set the appropriate fallback locale if needed.

#### Example:

```dart
class _LocalizationInit {
  static List<Locale> supportedLocales = [
    Locale('en', 'US'), // English
    Locale('es', 'ES'), // Spanish
    Locale(LocaleEnum.tr.languageCode, LocaleEnum.tr.region), // Turkish
  ];

  static String path = 'assets/translations';
  static Locale fallbackLocale = Locale('en', 'US');

  Future<void> initLocale() async {
    await EasyLocalization.ensureInitialized();
  }
}
```

This ensures that the application recognizes and supports the newly added language.

---

## 📂 Storing Translations

The translations are stored in JSON format inside `assets/translations`.

### Example:

📁 `assets/translations/en.json`

```json
{
  "auth": {
    "signin": {
      "pageTitle": "Sign In",
      "email": "Email",
      "password": "Password"
    }
  }
}
```

📁 `assets/translations/es.json`

```json
{
  "auth": {
    "signin": {
      "pageTitle": "Iniciar sesión",
      "email": "Correo electrónico",
      "password": "Contraseña"
    }
  }
}
```

Ensure that each translation file follows the same structure for consistency.

---

## 🚀 How to Use LocaleKeys

To retrieve a localized string, use `LocaleKeys.your_key.tr()`.

### Example:

```dart
import 'package:easy_localization/easy_localization.dart';
import '../../config/localization/lang/locale_keys.g.dart';

Text(LocaleKeys.auth_signin_pageTitle.tr()),
```

This will display the translated text for `auth_signin_pageTitle` based on the user's selected language.

---

## 🔄 Switching Languages

To change the app’s language dynamically:

```dart
context.setLocale(Locale('es')); // Switch to Spanish
```

To get the current locale:

```dart
Locale currentLocale = context.locale;
```

---

## 🛠 Best Practices

✅ Always use `LocaleKeys.some_key.tr()` instead of hardcoded strings.
✅ Keep translation keys structured in `assets/translations`.
✅ Run the `generate` command after updating translations.
✅ Update `localization_init.dart` when adding a new language.
✅ Ensure that translation files maintain a consistent structure.
✅ Use `context.setLocale()` for switching languages dynamically.

By following these practices, you ensure a **scalable** and **maintainable** localization system for your app! 🚀
