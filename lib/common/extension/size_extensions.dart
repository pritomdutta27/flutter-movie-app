
import 'package:movie_app/common/screenutils/screenutil.dart';

extension SizeExtensions on num {
  double get w => ScreenUtil.setWidths(this);
  double get h => ScreenUtil.setHeights(this);
  double get sp => ScreenUtil.setSps(this);
}