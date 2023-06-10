


import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import '../../utils/app_color.dart';
import '../../utils/constants.dart';

class TranItemList extends StatelessWidget {
  const TranItemList({
    super.key,
    required this.infoName,
    required this.infoDetails,
    this.showCopyButton = false,
  });
  final String infoName, infoDetails;
  final bool showCopyButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(autoAdjustHeight(10)),
        Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              infoName,
              style: kTextStyleCustom(
                fontSize: 14,
                color: kBLKLIGHTDeepColor,
              ),
            ),
            Expanded(
              child: Text(
                infoDetails,
                textAlign: TextAlign.right,
                style: kTextStyleCustom(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kDeepBlack,
                ),
              ),
            ),
            Visibility(
              visible: showCopyButton,
              child: Padding(
                padding: EdgeInsets.only(left: autoAdjustWidth(12.5)),
                child: InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: infoDetails));
                    kToastMsgPopUp('Copied!!!!', ToastGravity.CENTER);
                  },
                  child: SvgPicture.asset('assests/svgs/clipboard.svg'),
                ),
              ),
            )
          ],
        ),
        Gap(autoAdjustHeight(10)),
        Divider(
          thickness: autoAdjustHeight(0.2),
          height: autoAdjustHeight(0.2),
          color: kDeepBlack,
        )
      ],
    );
  }
}
