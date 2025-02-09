# Route Configuration Guide

This guide will teach you how to properly configure and manage routing in **Base App v2**. We use **GoRouter** for navigation while adhering to **Clean Architecture principles**. By following this guide, you'll learn how to structure routes, handle redirections, and manage authentication states efficiently.

---

## 📌 Overview

The **route config** directory houses all routing-related files, ensuring modularity and maintainability. The routing system is designed to support **authentication-based redirects** and allows for easy expansion with new routes. Developers should strictly follow the defined structure for consistency.

### 🔧 Directory Structure

```
config/
 ├── route_config/
 │   ├── redirectors/
 │   │   ├── base_route_redirector.dart
 │   │   ├── authentication_based_redirect.dart
 │   ├── routes/
 │   │   ├── base_route_class.dart
 │   │   ├── initial_route.dart
 │   │   ├── signin_route.dart
 │   ├── auth_change_notifier.dart
 │   ├── router.dart
```

---

## 🚀 How to Implement Routes

All route classes **must** extend `BaseRouteClass` and should be registered inside `router.dart`. Let's go step by step.

### **1️⃣ Creating a New Route**

To add a new route:

1. **Navigate** to `routes/` folder.
2. **Create a new Dart file** (e.g., `profile_route.dart`).
3. **Extend** `BaseRouteClass` and implement required methods.

#### Example:

```dart
final class ProfileRoute extends BaseRouteClass {
  @override
  String get path => '/profile';

  @override
  String get name => 'profile';

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => const ProfilePage();

  /// Optional: Define a redirect rule
  @override
  FutureOr<String?> Function(BuildContext, GoRouterState)? get redirect =>
     YourRedirector.redirect;

  /// Optional: Define child routes
  @override
  List<GoRoute> get routes => [];
}
```

---

### **2️⃣ Registering the Route in the Router**

After creating the route, you **must** register it inside `router.dart`.

Modify `_router` instance in `AppRouter`:

```dart
static final GoRouter _router = GoRouter(
  refreshListenable: _authChangeNotifier,
  redirect: AuthenticationBasedRedirector().redirect,
  initialLocation: InitialRoute().route.path,
  routes: [
    InitialRoute().route,
    SignInRoute().route,
    ProfileRoute().route, // ✅ Add new routes here
  ],
);
```

> **⚠️ IMPORTANT:** Only main routes should be listed here. **Do not** add sub-routes inside this list.

---

### **3️⃣ Handling Redirects**

Redirects allow conditional navigation. If a route requires redirection, implement the `redirect` method:

```dart
@override
FutureOr<String?> Function(BuildContext, GoRouterState)? get redirect =>
   YourRedirector.redirect;
```

---

### **4️⃣ Adding Child Routes**

If a route has **sub-routes**, define them inside `routes` list:

```dart
@override
List<GoRoute> get routes => [
  YourChildRoute().route,
];
```

---

## 🔀 Route Redirectors

### **BaseRouteRedirector**

📌 **Located at:** `redirectors/base_route_redirector.dart`

- **Defines** the structure for all redirectors.
- **Ensures** every redirector implements the `redirect` method.
- If `redirect` method returns `null`, no redirection occurs.

```dart
abstract class BaseRouteRedirector {
  FutureOr<String?> redirect(BuildContext context, GoRouterState state);
}
```

### **AuthenticationBasedRedirector**

📌 **Located at:** `redirectors/authentication_based_redirect.dart`

- Handles **authentication-based redirection**.
- Redirects **unauthenticated users** to **Sign In** page.

```dart
class AuthenticationBasedRedirector implements BaseRouteRedirector {
  static final AuthenticationBasedRedirector _instance = AuthenticationBasedRedirector._internal();
  factory AuthenticationBasedRedirector() => _instance;

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final isLoggedIn = AuthService().currentUser != null;
    if (!isLoggedIn) {
      return state.namedLocation(SignIn().route.name ?? "");
    }
    return null; // ✅ No redirection needed
  }
}
```

---

## 🔄 Authentication Change Notifier

📌 **Located at:** `auth_change_notifier.dart`

- **Watches authentication state changes**.
- **Notifies** listeners when a change occurs, causing the router to refresh.

```dart
class AuthChangeNotifier extends ChangeNotifier {
  void notify() {
    notifyListeners();
  }
}
```

---

## 🛠 Using the Router in the Application

To **use the router**, initialize `AppRouter` and access its instance:

```dart
final router = AppRouter().router;
```

> **✅ Best Practice:** Use the **name** property for navigation instead of hardcoded paths. It’s safer and easier.

---
