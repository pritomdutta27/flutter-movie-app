import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:movie_app/presentation/movie_app.dart';
import 'package:pedantic/pedantic.dart';
import 'common/screenutils/screenutil.dart';
import 'di/get_it.dart' as getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  );
  ScreenUtil.init(
    width: 414,
    height: 896,
  );
  unawaited(getIt.init());
  runApp(const MovieApp());
}
