

import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'app_color.dart';



TextStyle kTextStyleCustom({
  Color color = kBLKCOLOUR,
  double fontSize = 16,
  FontStyle fontStyle = FontStyle.normal,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return TextStyle(
    fontSize: autoAdjustHeight(fontSize),
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    color: color,
  );
}