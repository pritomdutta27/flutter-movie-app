import 'package:flutter/material.dart';
import 'package:movie_app/common/extension/size_extensions.dart';

class Logo extends StatelessWidget {

  final double height;

  const Logo({
    super.key,
    required this.height,
  }) : assert(height > 0, 'Height must be greater than 0');

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/logo.png',
      color: Colors.white,
      height: height.h,
    );
  }}