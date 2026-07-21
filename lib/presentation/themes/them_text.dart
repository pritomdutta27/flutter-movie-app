import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/common/extension/size_extensions.dart';
import 'package:movie_app/presentation/themes/app_color.dart';

import '../../common/constants/size_constants.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteTitleLarge =>
      (_poppinsTextTheme.titleLarge ?? const TextStyle()).copyWith(
        fontSize: Sizes.dimen_20.sp,
        color: Colors.white,
      );

  static TextStyle get _whiteSubTitle1 =>
      (_poppinsTextTheme.bodySmall ?? const TextStyle()).copyWith(
        fontSize: Sizes.dimen_16.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold
      );

  static TextStyle get _whiteBodyText1 =>
      (_poppinsTextTheme.bodySmall ?? const TextStyle()).copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: Colors.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextTheme getTextTheme() {
    return TextTheme(
      titleLarge: _whiteTitleLarge,
      titleSmall: _whiteSubTitle1,
      titleMedium: _whiteBodyText1,
    );
  }
}

extension TextThemeExtensions on TextTheme {
  TextStyle get royalBlueSubTitle1 =>( titleSmall ?? const TextStyle()).copyWith(
    color: AppColor.royalBlue,
    fontWeight: FontWeight.w600,
  );
}

// Theme.of(context).textTheme.royalBlueSubTitle1
