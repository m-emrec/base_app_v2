# Theme Layer Guide

This guide will help you understand how to use and extend the **theme layer** in **Base App v2**. The app follows a structured approach to theming by using **ThemeExtensions** and private **widget themes** to ensure maintainability and customization.

---

## 📌 Overview

The theme layer consists of several components:

1. **Theme Extensions:** Custom extensions for adding new properties to the theme.
2. **Widget Themes:** Private classes that define styles for built-in widgets.
3. **App Theme:** The main theme configuration where all components are combined.

### 📁 Directory Structure

```
config/
 ├── theme/
 │   ├── theme_extensions/
 │   │   ├── custom_bottom_sheet_theme.dart
 │   │   ├── inline_text_button_theme.dart
 │   ├── widget_themes/
 │   │   ├── _app_bar_theme.dart
 │   │   ├── _check_box_theme.dart
 │   │   ├── _chip_theme.dart
 │   │   ├── _custom_bottom_sheet_theme.dart
 │   │   ├── _date_picker_theme.dart
 │   │   ├── _elevated_button_theme.dart
            ...
 │   ├── app_theme.dart
```

---

## 🎨 Widget Themes

Widget themes are written as **private classes** inside `widget_themes/`. They configure how built-in widgets appear in the app.

### Example: AppBar Theme

Located in: `widget_themes/_app_bar_theme.dart`

```dart
final class _AppBarTheme {
  static final AppBarTheme appBarTheme = AppBarTheme(
    color: AppColors.backgroundColor[50],
    actionsIconTheme: IconThemeData(color: AppColors.secondaryColor[50]),
  );
}
```

### 📌 Adding a New Widget Theme

To add a new widget theme:

1. **Create a new file** inside `widget_themes/`.
2. **Define a private class** (prefix with `_`).
3. **Register it in `app_theme.dart`**.

Example:

```dart
final class _SwitchTheme {
  static final SwitchThemeData switchTheme = SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.primaryColor[50]),
  );
}
```

Then, register it inside `app_theme.dart`:

```dart
switchTheme: _SwitchTheme.switchTheme,
```

---

## 🌟 Using the Theme in Your App

To access a theme property:

```dart
Theme.of(context).appBarTheme;

or

context.theme.appBarTheme
```

To access a **ThemeExtension**:

```dart
Theme.of(context).extension<CustomCardTheme>()?.cardColor;

or

context.theme.extension<CustomCardTheme>()?.cardColor;
```

---

## 🛠 Best Practices

✅ **Use `ThemeExtension` for custom styling** instead of adding new properties to `ThemeData`.
✅ **Keep widget themes private** (`_ClassName`) to prevent unnecessary imports in other files.
