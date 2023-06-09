import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';

import '../app_color.dart';
import '../constants.dart';

class BanklyMainButton extends StatelessWidget {
  const BanklyMainButton({
    super.key,
    this.backgroundColor = kPRYCOLOUR,
    this.cornerRadius = 10,
    this.child,
    required this.text,
    this.textColor = kWHTCOLOUR,
    this.useCustom = false,
    required this.onTap,
  });
  final bool useCustom;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double cornerRadius;
  final Widget? child;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius:
                BorderRadius.circular(autoAdjustHeight(cornerRadius))),
        height: autoAdjustHeight(56),
        child: Center(
          child: useCustom
              ? child
              : Text(
                  text,
                  style: kTextStyleCustom(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
