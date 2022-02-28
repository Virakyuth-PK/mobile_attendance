/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesPngsGen get pngs => const $AssetsImagesPngsGen();
  $AssetsImagesSvgsGen get svgs => const $AssetsImagesSvgsGen();
}

class $AssetsImagesPngsGen {
  const $AssetsImagesPngsGen();

  /// File path: assets/images/pngs/cambodiaRound.png
  AssetGenImage get cambodiaRound =>
      const AssetGenImage('assets/images/pngs/cambodiaRound.png');

  /// File path: assets/images/pngs/cambodia_flag.png
  AssetGenImage get cambodiaFlag =>
      const AssetGenImage('assets/images/pngs/cambodia_flag.png');

  /// File path: assets/images/pngs/cmg_cover.png
  AssetGenImage get cmgCover =>
      const AssetGenImage('assets/images/pngs/cmg_cover.png');

  /// File path: assets/images/pngs/englandRound.png
  AssetGenImage get englandRound =>
      const AssetGenImage('assets/images/pngs/englandRound.png');

  /// File path: assets/images/pngs/england_flag.png
  AssetGenImage get englandFlag =>
      const AssetGenImage('assets/images/pngs/england_flag.png');

  /// File path: assets/images/pngs/id_card.png
  AssetGenImage get idCard =>
      const AssetGenImage('assets/images/pngs/id_card.png');

  /// File path: assets/images/pngs/input_phone.png
  AssetGenImage get inputPhone =>
      const AssetGenImage('assets/images/pngs/input_phone.png');

  /// File path: assets/images/pngs/logo_attendance.png
  AssetGenImage get logoAttendance =>
      const AssetGenImage('assets/images/pngs/logo_attendance.png');

  /// File path: assets/images/pngs/logo_cmg.png
  AssetGenImage get logoCmg =>
      const AssetGenImage('assets/images/pngs/logo_cmg.png');

  /// File path: assets/images/pngs/logo_cmg_text.png
  AssetGenImage get logoCmgText =>
      const AssetGenImage('assets/images/pngs/logo_cmg_text.png');

  /// File path: assets/images/pngs/paper.png
  AssetGenImage get paper =>
      const AssetGenImage('assets/images/pngs/paper.png');

  /// File path: assets/images/pngs/time.png
  AssetGenImage get time => const AssetGenImage('assets/images/pngs/time.png');

  /// File path: assets/images/pngs/time_f1.png
  AssetGenImage get timeF1 =>
      const AssetGenImage('assets/images/pngs/time_f1.png');

  /// File path: assets/images/pngs/time_f2.png
  AssetGenImage get timeF2 =>
      const AssetGenImage('assets/images/pngs/time_f2.png');

  /// File path: assets/images/pngs/time_f3.png
  AssetGenImage get timeF3 =>
      const AssetGenImage('assets/images/pngs/time_f3.png');

  /// File path: assets/images/pngs/time_in.png
  AssetGenImage get timeIn =>
      const AssetGenImage('assets/images/pngs/time_in.png');

  /// File path: assets/images/pngs/time_out.png
  AssetGenImage get timeOut =>
      const AssetGenImage('assets/images/pngs/time_out.png');
}

class $AssetsImagesSvgsGen {
  const $AssetsImagesSvgsGen();

  /// File path: assets/images/svgs/calendar.svg
  String get calendar => 'assets/images/svgs/calendar.svg';

  /// File path: assets/images/svgs/exclamation.svg
  String get exclamation => 'assets/images/svgs/exclamation.svg';

  /// File path: assets/images/svgs/filter.svg
  String get filter => 'assets/images/svgs/filter.svg';

  /// File path: assets/images/svgs/flip.svg
  String get flip => 'assets/images/svgs/flip.svg';

  /// File path: assets/images/svgs/right_arrow.svg
  String get rightArrow => 'assets/images/svgs/right_arrow.svg';

  /// File path: assets/images/svgs/search.svg
  String get search => 'assets/images/svgs/search.svg';
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
