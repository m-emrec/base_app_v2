# Core Resources Guide

Welcome! In this guide, we will **deep dive** into the Core Resources of **Base App v2**. By the end of this document, you will understand **what the Core Resources folder contains, how to use it, and why it is essential for a scalable and maintainable app.**

---

## 📌 What is the Core Resources Folder?

The **Core Resources** folder acts as the **foundation of your application**. It provides a set of reusable utilities and abstractions that handle:

✅ **Data State Management** – Handling success and error states consistently.
✅ **Error Management** – Providing human-readable error messages instead of raw codes.
✅ **Use Case Implementation** – Structuring business logic in a reusable manner.
✅ **Firebase Utilities** – Providing easy access to Firebase services (Auth, Firestore, Storage, Cloud Functions).

The goal of this layer is to **keep the application modular, maintainable, and testable** by separating concerns and preventing code duplication.

---

## 📁 Directory Structure

The Core Resources folder is structured as follows:

```
core/
 ├── resources/
 │   ├── data_state.dart          # Handles success & failure responses
 │   ├── error_manager.dart       # Centralized error handling
 │   ├── use_case.dart            # Business logic structuring
 │   ├── firebase/
 │   │   ├── firebase_utils.dart  # Common Firebase service instances
 │   │   ├── firebase_auth_utils.dart  # Authentication helper methods
 │   │   ├── firebase_cloud_functions_utils.dart  # Cloud Function calls
 │   │   ├── firebase_storage_utils.dart  # File upload & storage handling
 │   │   ├── firestore_utils.dart  # Firestore database operations
```

Each of these files serves a **specific purpose**, which we will now explore in detail. 🚀

---

## 🔥 Step 1: Managing API & Database Responses (`data_state.dart`)

### 🧐 Why is this important?

Handling API calls or database requests requires managing **both success and failure cases**. Instead of manually checking every response, we use a **standardized approach** to handle data states effectively.

### 🔹 How It Works

```dart
abstract class DataState<T> {
  final String? errorMessage;
  final T? resultData;
}

final class DataSuccess<T> extends DataState<T> {
  DataSuccess([T? resultData]) : super(resultData: resultData);
}

final class DataFailed<T> extends DataState<T> {
  DataFailed(String errorMessage) : super(errorMessage: errorMessage);
}
```

### ✅ How to Use It

```dart
Future<DataState<User>> fetchUserData() async {
  try {
    final response = await apiService.getUserProfile();
    return DataSuccess(response);
  } catch (e) {
    return DataFailed("Failed to fetch user data");
  }
}
```

By structuring data states this way, we ensure **clean and maintainable** code.

---

## 🚨 Step 2: Handling Errors Gracefully (`error_manager.dart`)

### 🧐 Why is this important?

Users should **never see raw error codes** like `ERR_401`. Instead, we **map error codes to user-friendly messages** for better UX.

### 🔹 Example Usage

```dart
try {
  final user = await authService.login(email, password);
} catch (errorCode) {
  print(AppErrorText.errorMessageConverter(errorCode));
}
```

Instead of showing:

```
FirebaseAuthException: ERROR_INVALID_EMAIL
```

The app will display:

```
Invalid email format. Please check and try again.
```

This greatly **improves user experience**. 🎯

---

## 🔧 Step 3: Structuring Business Logic (`use_case.dart`)

### 🧐 Why is this important?

A **Use Case** defines the **business logic** of a specific action, ensuring:
✅ **Encapsulation** – Each action has its own class.
✅ **Reusability** – The same use case can be used in different parts of the app.
✅ **Testability** – Easily tested in isolation.

### 🔹 Use Case Template

```dart
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams {}
```

#### ✅ Example: Fetching a User Profile

```dart
class GetUserProfile extends UseCase<User, String> {
  final UserRepository repository;

  GetUserProfile(this.repository);

  @override
  Future<User> call(String userId) async {
    return repository.fetchUser(userId);
  }
}
```

This makes business logic **structured and reusable**. 🎯

---

## Firebase Utilities

### 🧐 Why are Firebase Utilities important?

Managing Firebase services can be **repetitive and error-prone**. We use **FirebaseUtils** and mixins to **simplify and modularize** Firebase interactions.

### 🔹 Firebase instances (`firebase_utils.dart`)

This file provides **instances** of Firebase services:

```dart
abstract class FirebaseUtils {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
}
```

### 🔹 Authentication Helpers (`firebase_auth_utils.dart`)

Manages **sign in, sign out, and authentication flows**.

```dart
mixin FirebaseAuthUtils on FirebaseUtils {
  Future<void> signOut() async {
    return auth.signOut();
  }
}
```

#### ✅ Example:

```dart
class DatabaseService extends FirebaseUtils with FirestoreUtils,
// And other necessary  Util classes
///For example if you need to use methods for `FirebaseStorage`include
///`FirebaseStorageUtils`too.
{
  Future<DocumentReference<Map<String, dynamic>>> fetchUserData(String uid){
    return getDocumentRef(
     collection:CollectionEnum.users,
     docId:uid,
    );
  }
}
```

### 🔹 Firestore Operations (`firestore_utils.dart`)

Simplifies **CRUD operations** in Firestore.

Instead of

```dart
Firebase.instance.collection("users").doc()
```

Use

```dart
getDocumentRef(
     collection:CollectionEnum.users,
     docId:uid,
    );
```

### 🔹 Storage Operations (`firebase_storage_utils.dart`)

Contains easy access to common `FirebaseStorage` methods.

```dart

uploadImageToFirebaseStorage({
     path:"path-to-database",
     filePath:"filepath",
  })
```

### 🔹 Cloud Functions (`firebase_cloud_functions_utils.dart`)

Contains easy access to common `CloudFunction` methods.

---

## 🛠 Best Practices

✅ **Use `DataState` for handling API responses**.
✅ **Map error codes using `ErrorManager` for better UX**.
✅ **Follow `UseCase` pattern for business logic**.
✅ **Use `FirebaseUtils` and its mixins to keep Firebase interactions modular**.
✅ **Never write Firebase queries directly in UI** – use a separate service.

By following these guidelines, your application will remain **scalable, maintainable, and easy to extend**. 🚀
