# Core Extensions Guide

This guide explains the **Core Extensions** used in **Base App v2**, how they enhance the development experience, and how to use them effectively.

---

## 📁 Directory Structure

```
core/
 ├── extensions/
 │   ├── context_extension.dart
 │   ├── media_query_extension.dart
```

---

## 🚀 Context Extension

📁 **File:** `context_extension.dart`

The `ContextExtension` provides quick access to common Flutter components via **BuildContext**.

### 🔹 Available Methods

```dart
extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}
```

### ✅ How to Use

```dart
final theme = context.theme;
final textTheme = context.textTheme;
final mediaQuery = context.mediaQuery;
```

These shortcuts make accessing `ThemeData`, `TextTheme`, and `MediaQuery` much easier.

---

## 📏 Media Query Extension

📁 **File:** `media_query_extension.dart`

The `MediaQueryExtension` provides convenient methods for retrieving **screen dimensions** and calculating **responsive sizes**.

### 🔹 Available Methods

```dart
extension MediaQueryExtension on BuildContext {
  Size get screenSize => mediaQuery.size;
  double get keyboardSize => mediaQuery.viewInsets.bottom;

  double dynamicWidth(double val) {
    assert(val <= 1, "Value cannot be greater than 1");
    return screenSize.width * val;
  }

  double dynamicHeight(double val) {
    assert(val <= 1, "Value cannot be greater than 1");
    return screenSize.height * val;
  }
}
```

### ✅ How to Use

```dart
final screenSize = context.screenSize;
final keyboardHeight = context.keyboardSize;

Container(
  width: context.dynamicWidth(0.5), // 50% of screen width
  height: context.dynamicHeight(0.3), // 30% of screen height
);
```

---
