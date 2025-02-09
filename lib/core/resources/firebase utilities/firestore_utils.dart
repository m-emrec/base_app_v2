import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/constants/firebase/collection_enums.dart';
import 'firebase_utils.dart';

/// A mixin that provides utility methods for interacting with Firestore.
/// This mixin extends the [FirebaseUtils] class and provides methods for
/// adding, updating, and deleting documents in Firestore.
/// It also provides methods for getting references to Firestore collections,
/// documents, and sub-collections.
///
/// This mixin is used in classes that need to interact with Firestore.
mixin FirestoreUtils on FirebaseUtils {
  /// Adds a new document to a Firestore collection.
  ///
  /// This method takes a map of key-value pairs representing the document
  /// fields and their values, and adds it to the specified Firestore collection.
  ///
  /// Returns a [Future] that completes with a [DocumentReference] pointing to
  /// the newly created document.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> data = {
  ///   'name': 'John Doe',
  ///   'age': 30,
  ///   'email': 'johndoe@example.com'
  /// };
  /// DocumentReference<Map<String, dynamic>> docRef = await addDocument(data);
  /// ```
  ///
  /// Throws a [FirebaseException] if the document could not be added.
  Future<DocumentReference<Map<String, dynamic>>> addDocumentToCollection(
    CollectionEnum collection,
    Map<String, dynamic> data,
  ) async =>
      getCollectionRef(collection).add(data);

  /// Adds a document to a Firestore collection with a **custom ID**.
  /// This method takes a map of key-value pairs representing the document data
  /// and adds it to the specified Firestore collection with the specified ID.
  /// Returns a [Future] that completes
  ///
  /// Example usage:
  /// ```dart
  /// await addDocumentToCollectionWithCustomId(
  ///  collection: CollectionEnum.users,
  /// docId: 'userId123',
  /// data: {'name': 'John Doe', 'age': 30},
  /// );
  /// ```
  Future<void> addDocumentToCollectionWithCustomId({
    required CollectionEnum collection,
    required String docId,
    required Map<String, dynamic> data,
  }) async =>
      getCollectionRef(collection).doc(docId).set(data);

  /// Adds a document to a specified sub-collection in Firestore.
  ///
  /// This method takes a map of key-value pairs representing the document data
  /// and adds it to the specified sub-collection under a given document.
  ///
  /// Returns a [Future] that completes with a [DocumentReference] pointing to
  /// the newly added document.
  ///
  /// Example usage:
  /// ```dart
  /// final docRef = await addDocumentToSubCollection(
  ///   'users',
  ///   'userId123',
  ///   'orders',
  ///   {'orderId': 'order123', 'amount': 100}
  /// );
  /// ```
  ///
  /// Throws a [FirebaseException] if the operation fails.
  Future<DocumentReference<Map<String, dynamic>>> addDocumentToSubCollection(
    CollectionEnum collection,
    CollectionEnum subCollection,
    Map<String, dynamic> data,
    DocumentReference<Map<String, dynamic>> docRef,
  ) async =>
      getSubCollectionRef(
        collection: collection,
        docId: docRef.id,
        subCollection: subCollection,
      ).add(data);

  /// Updates a document in the Firestore database.
  ///
  /// This method allows you to update a specific document in a Firestore
  /// collection. You need to provide the necessary parameters to identify
  /// the document and the data to be updated.
  ///
  /// Example usage:
  /// ```dart
  /// await updateDocument(
  ///   collectionPath: 'users',
  ///   documentId: 'user123',
  ///   data: {'name': 'John Doe', 'age': 30},
  /// );
  /// ```
  ///
  /// Throws a [FirebaseException] if the update operation fails.
  ///
  /// Parameters:
  /// - `collectionPath`: The path to the Firestore collection containing the document.
  /// - `documentId`: The ID of the document to be updated.
  /// - `data`: A map containing the fields and values to be updated in the document.
  ///
  /// Returns a [Future] that completes when the update operation is finished.
  Future<void> updateDocument({
    required CollectionEnum collection,
    required String docId,
    required Map<String, dynamic> data,
  }) async =>
      getDocumentRef(collection: collection, docId: docId).update(data);

  /// Deletes a document from the Firestore database.
  ///
  /// This method deletes a document from the Firestore database based on the
  /// provided parameters.
  ///
  /// The [collectionPath] parameter specifies the path to the collection
  /// containing the document to be deleted.
  ///
  /// The [documentId] parameter specifies the ID of the document to be deleted.
  ///
  /// Throws a [FirebaseException] if the document could not be deleted.
  ///
  /// Example usage:
  /// ```dart
  /// await deleteDocument(
  ///   collectionPath: 'users',
  ///   documentId: 'user123',
  /// );
  /// ```
  ///
  /// Note: Ensure that the user has the necessary permissions to delete the
  /// document.
  Future<void> deleteDocument({
    required CollectionEnum collection,
    required String docId,
  }) async =>
      getDocumentRef(
        collection: collection,
        docId: docId,
      ).delete();

  /// Returns a [DocumentReference] to the user document in Firestore.
  ///
  /// This method retrieves the document reference for the current user's
  ///  document in the Firestore collection specified by [CollectionEnum.users].
  Future<DocumentReference<Map<String, dynamic>>> getUserDocRef() async =>
      getCollectionRef(CollectionEnum.users).doc(uid);

  /// Updates the current user's data in Firestore.
  /// This method updates the user data in Firestore with the provided data.
  ///
  Future<void> updateUserData(Map<String, dynamic> data) async {
    await getUserDocRef().then((docRef) => docRef.update(data));
  }

  /// Returns a [CollectionReference] to the specified Firestore collection.
  ///
  /// This method retrieves the collection reference for the given [collection]
  /// in Firestore.
  CollectionReference<Map<String, dynamic>> getCollectionRef(
    CollectionEnum collection,
  ) =>
      firestore.collection(collection.name);

  /// Returns a reference to a document in a Firestore collection.
  ///
  /// This method is used to get a reference to a specific document within a
  /// Firestore collection. The document reference can be used to read, write,
  /// or listen to the document's data.
  ///
  /// Returns:
  ///   A [DocumentReference] object that points to the specified document.
  DocumentReference<Map<String, dynamic>> getDocumentRef({
    required CollectionEnum collection,
    required String docId,
  }) =>
      firestore.collection(collection.name).doc(docId);

  /// Returns a reference to a sub-collection within a Firestore collection.
  ///
  /// This method is used to get a reference to a sub-collection of a specified
  /// Firestore collection. The sub-collection is identified by its name.
  ///
  /// Returns:
  ///   A [CollectionReference] object that points to the specified sub-collection.
  CollectionReference<Map<String, dynamic>> getSubCollectionRef({
    required CollectionEnum collection,
    required String docId,
    required CollectionEnum subCollection,
  }) =>
      firestore
          .collection(collection.name)
          .doc(docId)
          .collection(subCollection.name);

  /// Returns a reference to a sub-document within a Firestore collection.
  ///
  /// This method is used to get a reference to a specific sub-document
  /// within a Firestore collection. The sub-document is identified by
  /// its path within the collection.
  ///
  /// Returns:
  ///   A [DocumentReference] object that points to the specified sub-document.
  DocumentReference<Map<String, dynamic>> getSubDocumentRef({
    required CollectionEnum collection,
    required String docId,
    required CollectionEnum subCollection,
    required String subDocId,
  }) =>
      firestore
          .collection(collection.name)
          .doc(docId)
          .collection(subCollection.name)
          .doc(subDocId);
}
