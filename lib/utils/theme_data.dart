import 'package:flutter/material.dart';

import 'app_color.dart';

class BanklyThemeData {
  static ThemeData appThemeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: customKPrimaryColor,
      primaryColor: kPRYCOLOUR,
      scaffoldBackgroundColor: kScalfold,
    );
  }
}
