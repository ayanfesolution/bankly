import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CXSpinner extends StatelessWidget {
  const CXSpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: autoAdjustHeight(150),
        child: Lottie.asset('assests/loading.json'),
      ),
    );
  }
}
