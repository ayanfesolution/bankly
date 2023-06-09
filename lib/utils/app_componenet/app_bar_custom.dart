import 'package:auto_adjust/auto_adjust.dart';
import 'package:bankly/utils/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class BanklyCustomAppBar extends StatelessWidget {
  const BanklyCustomAppBar({
    super.key,
    this.shouldNavigate = false,
  });
  final bool shouldNavigate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (shouldNavigate == true) {
              RouteNavigators.pop(context);
            }
          },
          child: SizedBox(
            height: autoAdjustHeight(38),
            width: autoAdjustWidth(38),
            child: SvgPicture.asset('assests/svgs/back.svg'),
          ),
        ),
        Expanded(
          child: Center(
              child: Text(
            'Transactions',
            style: kTextStyleCustom(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          )),
        ),
        SizedBox(
          width: autoAdjustWidth(38),
        )
      ],
    );
  }
}
