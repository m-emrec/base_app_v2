# 🚀 Getting Started - Base App Template

Welcome to **Base App v2** – a **Flutter Starter Project** designed to provide a solid foundation for building scalable and maintainable applications. This template follows **Clean Architecture**, uses **Riverpod for state management**, includes **Firebase integration**, and supports **multi-language localization with EasyLocalization**.

This guide will walk you through **how to set up, run, and explore** this template effectively.

---

## 📌 Key Features

✅ **Clean Architecture**
   - Follows domain-driven design principles.
   - Separates concerns into domain, data, and presentation layers.

✅ **Authentication**
   - Firebase Authentication with Sign In flow.

✅ **Localization**
   - Supports multiple languages with EasyLocalization.
   - Centralized management using `locale_keys.g.dart`.

✅ **Clean Architecture**
   - Separation of UI and business logic.
   - Enhances code maintainability and scalability.

✅ **State Management with Riverpod**
   - Provides reactive and scalable state management.

✅ **Reusable UI Components**
   - Common widgets such as buttons, text fields, bottom sheets, and toast messages.

✅ **Firebase Integration**
   - Fully configured with Authentication, Firestore, Realtime Database, and Storage.

✅ **Routing**
   - Uses GoRouter for declarative navigation.

✅ **Custom Utilities**
   - Extensions for `context`, `media query`, and `scaffold messenger`.
   - Mixins for handling form states.

---

## 🛠 Requirements

Before setting up the project, ensure that you have the following installed:

- **Flutter SDK**: `3.6.0+`
- **Dart SDK**: Included with Flutter
- **Firebase CLI**: For setting up Firebase services



---

## 🚀 Installation & Setup

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/your-repo/base-app-v2.git
cd base-app-v2
```

### 2️⃣ Install Dependencies
```sh
flutter pub get
```

### 3️⃣ Configure Firebase
Follow these steps to set up Firebase:

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
2. Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) and place them in:
   - `android/app/` (for `google-services.json`)
   - `ios/Runner/` (for `GoogleService-Info.plist`)
3. Run the following command:
```sh
flutterfire configure
```

### 4️⃣ Run the Project
```sh
flutter run
```

---

## 📂 Folder Structure

Here's an overview of the project structure following Clean Architecture:

```
lib/
 ├── core/                   # Core utilities & shared resources
 │   ├── extensions/        # Custom extensions for context, media query, etc.
 │   ├── resources/         # Error handling, Firebase helpers, and data states
 │   ├── utils/             # Core initialization, localization, mixins
 │   ├── constants/         # Centralized constants (colors, padding, API keys)
 │   ├── logger/            # Logging utilities
 │   ├── models/            # Common data models
 │   ├── widgets/           # Common reusable UI components
 │
 ├── config/                 # Configuration files
 │   ├── localization/      # Localization settings and keys
 │   ├── routes/            # GoRouter navigation setup
 │   ├── theme/             # App themes and styles
 │
 ├── features/auth/          # Authentication feature module
 │   ├── data/             # Data layer (models, repositories, services)
 │   │   ├── models/      # Authentication-related models
 │   │   ├── repositories/ # Firebase or API repositories
 │   │   ├── services/     # Firebase authentication services
 │   │       ├── auth_service.dart # Handles sign-in logic
 │   ├── domain/           # Domain layer (business logic)
 │   │   ├── entities/     # Entity definitions
 │   │   ├── repositories/ # Abstract repositories
 │   │   ├── usecases/     # Use cases for authentication logic
 │   ├── presentation/     # UI layer (pages, providers, widgets)
 │       ├── pages/        # Sign-in and authentication pages
 │       ├── providers/    # Riverpod state management providers
 │       ├── widgets/      # UI components like login form
 │
 ├── product/                # Product-specific utilities
 │   ├── init/              # App initialization (localization, settings)
 │   ├── mixins/            # Common mixins for form validation, state handling
 │   ├── utility/           # Utility files (constants, extensions, validators)
 │   ├── widgets/           # Reusable UI components
 │       ├── buttons/       # Custom buttons
 │       ├── custom bottom sheet/ # Custom bottom sheets
 │       ├── custom_text_field.dart # Text field styles
 │       ├── custom_toast.dart # Toast notifications
 │       ├── loading_indicator.dart # Loading animation
```

---

## 📦 Dependencies Used

Here are some key dependencies used in this project:

| Package | Description |
|---------|-------------|
| **Firebase** | Authentication, Firestore, Storage, Cloud Functions |
| `firebase_core` | Initializes Firebase |
| `firebase_auth` | Handles authentication |
| `cloud_firestore` | Firestore database integration |
| `firebase_storage` | Firebase Storage for media |
| `cloud_functions` | Firebase Cloud Functions |
| **State Management** | |
| `flutter_riverpod` | Manages state reactively |
| **Localization** | |
| `easy_localization` | Multi-language support |
| **Navigation** | |
| `go_router` | Declarative routing |
| **UI Utilities** | |
| `toastification` | Toast messages |
| `skeletonizer` | Skeleton loading effect |
| `google_fonts` | Custom fonts |
| `lottie` | Lottie animations |

For a full list of dependencies, check the `pubspec.yaml` file.

---

## 🎯 Next Steps

Now that you've set up the project, you can:

✅ Explore the **folder structure** and understand how Clean Architecture is applied.
✅ Customize the **theme**, **routes**, and **localization** settings.
✅ Start building your app with the **preconfigured Firebase services**.

Happy coding! 🚀
