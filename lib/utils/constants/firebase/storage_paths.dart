/// This enum contains the paths to the storage locations in Firebase.
enum StoragePaths {
  /// The path to the profile image storage location.
  /// The path is `users/$param/profileImage/`.
  /// Give the user id as the parameter.
  profileImage,
  feedbackImages,
  ;

  /// Returns the path to the storage location.
  ///
  /// - [param] is the parameter that is used to generate the path.
  ///
  /// For :
  ///
  /// - [StoragePaths.profileImage], the path is `users/$user id/profileImage/`.
  ///
  /// - [StoragePaths.feedbackImages], the path is `feedbacks/$feedback id/image{image number}/`.
  ///  **The parameter must be a list. First item is the feedback id and the second item is the image number.**
  /// **If the list has only one item, then the path is `feedbacks/$feedback id/`.**
  String path<T>(T param) {
    switch (this) {
      /// param is the user id.
      case StoragePaths.profileImage:
        return 'users/$param/profileImage/';

      /// param is the feedback id.
      case StoragePaths.feedbackImages:
        assert(param is List, 'The parameter should be a list');
        param as List;
        if (param.length == 2) {
          return 'feedbacks/${param[0]}/image${param[1]}';
        } else {
          return 'feedbacks/${param[0]}';
        }
    }
  }
}
