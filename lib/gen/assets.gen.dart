/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/back.svg
  String get back => 'assets/icons/back.svg';

  /// File path: assets/icons/backward.svg
  String get backward => 'assets/icons/backward.svg';

  /// File path: assets/icons/checkmark.svg
  String get checkmark => 'assets/icons/checkmark.svg';

  /// File path: assets/icons/checkmark_active.svg
  String get checkmarkActive => 'assets/icons/checkmark_active.svg';

  /// File path: assets/icons/cup.png
  AssetGenImage get cup => const AssetGenImage('assets/icons/cup.png');

  /// File path: assets/icons/delete.svg
  String get delete => 'assets/icons/delete.svg';

  /// File path: assets/icons/delete_primary.svg
  String get deletePrimary => 'assets/icons/delete_primary.svg';

  /// File path: assets/icons/done.svg
  String get done => 'assets/icons/done.svg';

  /// File path: assets/icons/done_primary.svg
  String get donePrimary => 'assets/icons/done_primary.svg';

  /// File path: assets/icons/dropdown.svg
  String get dropdown => 'assets/icons/dropdown.svg';

  /// File path: assets/icons/edit.svg
  String get edit => 'assets/icons/edit.svg';

  /// File path: assets/icons/forward.svg
  String get forward => 'assets/icons/forward.svg';

  /// File path: assets/icons/list.png
  AssetGenImage get list => const AssetGenImage('assets/icons/list.png');

  /// File path: assets/icons/note.svg
  String get note => 'assets/icons/note.svg';

  /// File path: assets/icons/settings.svg
  String get settings => 'assets/icons/settings.svg';

  /// File path: assets/icons/stats.png
  AssetGenImage get stats => const AssetGenImage('assets/icons/stats.png');

  /// File path: assets/icons/sw.svg
  String get sw => 'assets/icons/sw.svg';

  /// List of all assets
  List<dynamic> get values => [
        back,
        backward,
        checkmark,
        checkmarkActive,
        cup,
        delete,
        deletePrimary,
        done,
        donePrimary,
        dropdown,
        edit,
        forward,
        list,
        note,
        settings,
        stats,
        sw
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/appbar
  $AssetsImagesAppbarGen get appbar => const $AssetsImagesAppbarGen();

  /// Directory path: assets/images/categories
  $AssetsImagesCategoriesGen get categories =>
      const $AssetsImagesCategoriesGen();

  /// Directory path: assets/images/onboarding
  $AssetsImagesOnboardingGen get onboarding =>
      const $AssetsImagesOnboardingGen();

  /// Directory path: assets/images/placeholders
  $AssetsImagesPlaceholdersGen get placeholders =>
      const $AssetsImagesPlaceholdersGen();
}

class $AssetsImagesAppbarGen {
  const $AssetsImagesAppbarGen();

  /// File path: assets/images/appbar/main.png
  AssetGenImage get main =>
      const AssetGenImage('assets/images/appbar/main.png');

  /// File path: assets/images/appbar/stats.png
  AssetGenImage get stats =>
      const AssetGenImage('assets/images/appbar/stats.png');

  /// List of all assets
  List<AssetGenImage> get values => [main, stats];
}

class $AssetsImagesCategoriesGen {
  const $AssetsImagesCategoriesGen();

  /// File path: assets/images/categories/art.png
  AssetGenImage get art =>
      const AssetGenImage('assets/images/categories/art.png');

  /// File path: assets/images/categories/crafts.png
  AssetGenImage get crafts =>
      const AssetGenImage('assets/images/categories/crafts.png');

  /// File path: assets/images/categories/fashion.png
  AssetGenImage get fashion =>
      const AssetGenImage('assets/images/categories/fashion.png');

  /// File path: assets/images/categories/gardening.png
  AssetGenImage get gardening =>
      const AssetGenImage('assets/images/categories/gardening.png');

  /// File path: assets/images/categories/music.png
  AssetGenImage get music =>
      const AssetGenImage('assets/images/categories/music.png');

  /// File path: assets/images/categories/photography.png
  AssetGenImage get photography =>
      const AssetGenImage('assets/images/categories/photography.png');

  /// File path: assets/images/categories/projects.png
  AssetGenImage get projects =>
      const AssetGenImage('assets/images/categories/projects.png');

  /// File path: assets/images/categories/sports.png
  AssetGenImage get sports =>
      const AssetGenImage('assets/images/categories/sports.png');

  /// File path: assets/images/categories/writing.png
  AssetGenImage get writing =>
      const AssetGenImage('assets/images/categories/writing.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        art,
        crafts,
        fashion,
        gardening,
        music,
        photography,
        projects,
        sports,
        writing
      ];
}

class $AssetsImagesOnboardingGen {
  const $AssetsImagesOnboardingGen();

  /// File path: assets/images/onboarding/1.png
  AssetGenImage get a1 => const AssetGenImage('assets/images/onboarding/1.png');

  /// File path: assets/images/onboarding/2.png
  AssetGenImage get a2 => const AssetGenImage('assets/images/onboarding/2.png');

  /// File path: assets/images/onboarding/3.png
  AssetGenImage get a3 => const AssetGenImage('assets/images/onboarding/3.png');

  /// List of all assets
  List<AssetGenImage> get values => [a1, a2, a3];
}

class $AssetsImagesPlaceholdersGen {
  const $AssetsImagesPlaceholdersGen();

  /// File path: assets/images/placeholders/history.png
  AssetGenImage get history =>
      const AssetGenImage('assets/images/placeholders/history.png');

  /// File path: assets/images/placeholders/main.png
  AssetGenImage get main =>
      const AssetGenImage('assets/images/placeholders/main.png');

  /// File path: assets/images/placeholders/stats.png
  AssetGenImage get stats =>
      const AssetGenImage('assets/images/placeholders/stats.png');

  /// List of all assets
  List<AssetGenImage> get values => [history, main, stats];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
    bool gaplessPlayback = false,
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
