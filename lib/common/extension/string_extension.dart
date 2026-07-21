import 'package:flutter/cupertino.dart';

import '../../presentation/app_localizations.dart';

extension StringExtension on String{

  String translate(BuildContext context){
    return AppLocalizations.of(context)?.translate(this) ?? "";
  }
}