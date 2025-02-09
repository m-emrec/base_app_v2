import 'dart:io';

import 'firebase_utils.dart';

/// A mixin that provides utility methods for Firebase Storage.
/// This mixin provides methods for uploading and deleting files from Firebase Storage.
/// It extends the [FirebaseUtils] class to use Firebase services.
mixin FirebaseStorageUtils on FirebaseUtils {
  /// Deletes a file from Firebase Storage.
  /// This method deletes the file at the specified [path].
  /// The [path] parameter is the path to the file to be deleted.
  ///
  /// It cannot delete a folder. Use [deleteFolderFromFirebaseStorage] to delete a folder.
  ///
  /// If you give a folder path, it will throw an ![object-not-found] error.
  Future<void> deleteFileFromFirebaseStorage(String path) async {
    await storage.ref(path).delete();
  }

  /// Deletes a folder from Firebase Storage.
  /// This method deletes all files and subfolders in the specified folder.
  /// The [path] parameter is the path to the folder to be deleted.
  ///
  /// ! - **Use with caution, as this operation is irreversible.**
  ///
  /// ! - **IT deletes all files and sub-folders in the specified folder.**
  Future<void> deleteFolderFromFirebaseStorage(String path) async {
    await storage
        .ref(
          path,
        )
        .listAll()
        .then(
      (result) {
        for (final ref in result.items) {
          ref.delete();
        }
      },
    );
  }

  /// Uploads an image file to Firebase Storage.
  ///
  /// This method uploads an image file to Firebase Storage at the specified
  /// [path].
  /// The [filePath] parameter is the local file path of the image to
  /// be uploaded.
  ///
  /// Returns a [Future] that completes with the download URL of the uploaded
  /// image.
  Future<String?> uploadImageToFirebaseStorage({
    required String path,
    required String filePath,
  }) async {
    final url = await storage
        .ref(
          path,
        )
        .putFile(
          File(filePath),
        )
        .then((value) => value.ref.getDownloadURL());

    return url;
  }
}
