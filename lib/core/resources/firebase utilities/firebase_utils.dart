import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

/// A utility class that provides Firebase services.
/// This class contains instances of Firebase services like Firestore, Auth,
/// Storage, and Realtime Database.
/// This class also provides the currently authenticated user and their ID.
/// This class is used in the Firebase utility classes.
///
/// This class contains the following instances:
/// - [firestore] - An instance of [FirebaseFirestore] for interacting with Firestore database.
///
/// - [auth] - An instance of [FirebaseAuth] for handling authentication.
///
/// - [storage] - An instance of [FirebaseStorage] for interacting with Firebase Storage.
///
/// - [rtd] - A reference to the root of the Firebase Realtime Database.
///
/// - [currentUser] - The currently authenticated user, or null if no user is signed in.
///
/// - [authStateChanges] - A stream that emits authentication state changes.
///
/// - [uid] - The ID of the currently authenticated user based on their phone number.
///
/// This class is used in the Firebase utility classes.
abstract class FirebaseUtils {
  /// An instance of [FirebaseFirestore] for interacting with Firestore
  ///  database.
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// An instance of [FirebaseAuth] for handling authentication.
  final FirebaseAuth auth = FirebaseAuth.instance;

  /// An instance of [FirebaseStorage] for interacting with Firebase Storage.
  final FirebaseStorage storage = FirebaseStorage.instance;

  /// A reference to the root of the Firebase Realtime Database.
  final DatabaseReference rtd = FirebaseDatabase.instance.ref();

  /// The currently authenticated user, or null if no user is signed in.
  User? get currentUser => auth.currentUser;

  /// A stream that emits authentication state changes.
  ///
  /// This stream emits the current user when the authentication state changes.
  Stream<User?> get authStateChanges => auth.authStateChanges();

  /// The UID of the currently authenticated user, or null if no user is
  /// signed in.
  String? get uid => currentUser?.uid;

  /// An instance of [FirebaseFunctions] for interacting with Firebase Functions.
  FirebaseFunctions get functions =>
      FirebaseFunctions.instanceFor(region: 'europe-west1');
}
