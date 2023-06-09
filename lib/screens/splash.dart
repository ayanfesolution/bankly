


import 'dart:async';

import 'package:auto_adjust/auto_adjust.dart';
import 'package:bankly/screens/trasactions/transaction_page.dart';
import 'package:bankly/utils/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashScreen extends StatefulHookWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'splash.screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  @override
  void initState(){
    initialAction();
    super.initState();
  }

  Future<Timer> initialAction() async {
    return Timer(
      const Duration(seconds: 4),
      () {
        RouteNavigators.routeReplace(context, const TransactionPage());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AnimationController controller = useAnimationController(
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    late final Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack,
    );
    SizeConfig().init(context, 896, 386);
    return Scaffold(
    
      body: Center(
        child: SizedBox(
          height: autoAdjustHeight(250),
          width: autoAdjustWidth(250),
          child: ScaleTransition(
            scale: animation,
            child: Image.asset(
              'assets/images/mainlogo.png',
              height: autoAdjustHeight(85),
              width: autoAdjustWidth(240),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}