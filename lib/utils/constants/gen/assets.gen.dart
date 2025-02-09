/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/ani_facebook.json
  String get aniFacebook => 'assets/animations/ani_facebook.json';

  /// File path: assets/animations/ani_google.json
  String get aniGoogle => 'assets/animations/ani_google.json';

  /// File path: assets/animations/ani_splash.json
  String get aniSplash => 'assets/animations/ani_splash.json';

  /// List of all assets
  List<String> get values => [aniFacebook, aniGoogle, aniSplash];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/addMemberIcon.svg
  String get addMemberIcon => 'assets/icons/addMemberIcon.svg';

  /// File path: assets/icons/add_event_icon.svg
  String get addEventIcon => 'assets/icons/add_event_icon.svg';

  /// File path: assets/icons/add_icon.svg
  String get addIcon => 'assets/icons/add_icon.svg';

  /// File path: assets/icons/add_picture_icon.svg
  String get addPictureIcon => 'assets/icons/add_picture_icon.svg';

  /// File path: assets/icons/adminButton_icon.svg
  String get adminButtonIcon => 'assets/icons/adminButton_icon.svg';

  /// File path: assets/icons/calendar_icon.svg
  String get calendarIcon => 'assets/icons/calendar_icon.svg';

  /// File path: assets/icons/complaint_icon.svg
  String get complaintIcon => 'assets/icons/complaint_icon.svg';

  /// File path: assets/icons/editImage_icon.svg
  String get editImageIcon => 'assets/icons/editImage_icon.svg';

  /// File path: assets/icons/filter_icon.svg
  String get filterIcon => 'assets/icons/filter_icon.svg';

  /// File path: assets/icons/logout_icon.svg
  String get logoutIcon => 'assets/icons/logout_icon.svg';

  /// File path: assets/icons/phoneIcon.svg
  String get phoneIcon => 'assets/icons/phoneIcon.svg';

  /// File path: assets/icons/roof_logo.png
  AssetGenImage get roofLogo =>
      const AssetGenImage('assets/icons/roof_logo.png');

  /// File path: assets/icons/sort_icon.svg
  String get sortIcon => 'assets/icons/sort_icon.svg';

  /// File path: assets/icons/whatsapp_icon.svg
  String get whatsappIcon => 'assets/icons/whatsapp_icon.svg';

  /// List of all assets
  List<dynamic> get values => [
        addMemberIcon,
        addEventIcon,
        addIcon,
        addPictureIcon,
        adminButtonIcon,
        calendarIcon,
        complaintIcon,
        editImageIcon,
        filterIcon,
        logoutIcon,
        phoneIcon,
        roofLogo,
        sortIcon,
        whatsappIcon
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/auth_image_2.png
  AssetGenImage get authImage2 =>
      const AssetGenImage('assets/images/auth_image_2.png');

  /// File path: assets/images/female_avatar.png
  AssetGenImage get femaleAvatar =>
      const AssetGenImage('assets/images/female_avatar.png');

  /// File path: assets/images/male_avatar.png
  AssetGenImage get maleAvatar =>
      const AssetGenImage('assets/images/male_avatar.png');

  /// File path: assets/images/temporary_auth_image.png
  AssetGenImage get temporaryAuthImage =>
      const AssetGenImage('assets/images/temporary_auth_image.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [authImage2, femaleAvatar, maleAvatar, temporaryAuthImage];
}

class $AssetsTextsGen {
  const $AssetsTextsGen();

  /// File path: assets/texts/turkey_cities.json
  String get turkeyCities => 'assets/texts/turkey_cities.json';

  /// List of all assets
  List<String> get values => [turkeyCities];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/tr-TR.json
  String get trTR => 'assets/translations/tr-TR.json';

  /// List of all assets
  List<String> get values => [trTR];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTextsGen texts = $AssetsTextsGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
