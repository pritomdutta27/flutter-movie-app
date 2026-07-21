import 'dart:ui' as ui;

class ScreenUtil {
  ScreenUtil._();

  static final ScreenUtil _instance = ScreenUtil._();

  factory ScreenUtil() => _instance;

  static const double defaultWidth = 414;
  static const double defaultHeight = 896;

  late double uiWidthPx;
  late double uiHeightPx;
  late bool allowFontScaling;

  static late double _screenWidth;
  static late double _screenHeight;
  static late double _pixelRatio;
  static late double _statusBarHeight;
  static late double _bottomBarHeight;
  static late double _textScaleFactor;

  static void init({
    double width = defaultWidth,
    double height = defaultHeight,
    bool allowFontScaling = false,
  }) {
    _instance.uiWidthPx = width;
    _instance.uiHeightPx = height;
    _instance.allowFontScaling = allowFontScaling;

    final view = ui.PlatformDispatcher.instance.views.first;

    _pixelRatio = view.devicePixelRatio;
    _screenWidth = view.physicalSize.width;
    _screenHeight = view.physicalSize.height;
    _statusBarHeight = view.padding.top;
    _bottomBarHeight = view.padding.bottom;
    _textScaleFactor = view.platformDispatcher.textScaleFactor;
  }

  static double get textScaleFactor => _textScaleFactor;

  static double get pixelRatio => _pixelRatio;

  /// Logical width (dp)
  static double get screenWidth => _screenWidth / _pixelRatio;

  /// Logical height (dp)
  static double get screenHeight => _screenHeight / _pixelRatio;

  /// Physical width (px)
  static double get screenWidthPx => _screenWidth;

  /// Physical height (px)
  static double get screenHeightPx => _screenHeight;

  /// Status bar height (dp)
  static double get statusBarHeight => _statusBarHeight / _pixelRatio;

  /// Status bar height (px)
  static double get statusBarHeightPx => _statusBarHeight;

  /// Bottom safe area (dp)
  static double get bottomBarHeight => _bottomBarHeight / _pixelRatio;

  double get scaleWidth => screenWidth / uiWidthPx;

  double get scaleHeight =>
      (_screenHeight - _statusBarHeight - _bottomBarHeight) /
          _pixelRatio /
          uiHeightPx;

  double get scaleText => scaleWidth;

  /// Width adaptation
  double setWidth(num width) => width * scaleWidth;

  /// Height adaptation
  double setHeight(num height) => height * scaleHeight;

  /// Font adaptation
  double setSp(
      num fontSize, {
        bool? allowFontScalingSelf,
      }) {
    final scaling = allowFontScalingSelf ?? allowFontScaling;

    return scaling
        ? fontSize * scaleText
        : (fontSize * scaleText) / _textScaleFactor;
  }

  static double setWidths(num width) =>
      _instance.setWidth(width);

  static double setHeights(num height) =>
      _instance.setHeight(height);

  static double setSps(
      num fontSize, {
        bool? allowFontScalingSelf,
      }) =>
      _instance.setSp(
        fontSize,
        allowFontScalingSelf: allowFontScalingSelf,
      );
}