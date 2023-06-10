



import 'package:auto_adjust/auto_adjust.dart';
import 'package:bankly/screens/trasactions/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../model/transaction_model.dart';
import '../../utils/app_color.dart';
import '../../utils/constants.dart';
import '../../utils/navigations.dart';

class TransactionSingleWidget extends StatelessWidget {
  const TransactionSingleWidget({super.key, required this.dataToUse});
  final TransactionsModelData dataToUse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: autoAdjustHeight(15)),
          child: InkWell(
            onTap: () {
              RouteNavigators.route(
                context,
                 TransactionDetailsPage(dataToUse: dataToUse,),
              );
            },
            child: Row(
              children: [
                Container(
                  height: autoAdjustHeight(24),
                  width: autoAdjustWidth(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      autoAdjustHeight(3),
                    ),
                    color: dataToUse.trnDrCr == TrnDrCr.DEPOSIT
                        ? kGreenBGCOLOR
                        : kREDLIGHTCOLOUR,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(autoAdjustHeight(9)),
                    child: SizedBox(
                      height: autoAdjustHeight(6),
                      width: autoAdjustWidth(6),
                      child: SvgPicture.asset(
                          dataToUse.trnDrCr == TrnDrCr.DEPOSIT
                              ? 'assests/svgs/moneyin.svg'
                              : 'assests/svgs/moneyout.svg'),
                    ),
                  ),
                ),
                Gap(autoAdjustWidth(25)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kReturnTheTransactionName(dataToUse.trnDrCr),
                        style: kTextStyleCustom(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Gap(autoAdjustHeight(6)),
                      Text(
                        formatDateOne(dataToUse.trnDate!),
                        style: kTextStyleCustom(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: kBLKLIGHTDeepColor),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${dataToUse.trnDrCr == TrnDrCr.DEPOSIT ? '+' : '-'}₦${dataToUse.trnAmount}',
                  style: kTextStyleCustom(
                    fontWeight: FontWeight.w400,
                    color: dataToUse.trnDrCr == TrnDrCr.DEPOSIT
                        ? kGreenSuccessfulCOLOR
                        : kREDCOLOUR,
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: kDividerCOLOR,
          thickness: autoAdjustHeight(1),
        )
      ],
    );
  }
}
