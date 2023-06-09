import 'package:bankly/screens/splash.dart';
import 'package:bankly/utils/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bankly Transaction',
      theme: BanklyThemeData.appThemeData(context),
      home: const SplashScreen(),
    );
  }
}
