import 'package:auto_adjust/auto_adjust.dart';
import 'package:bankly/screens/trasactions/transaction_details.dart';
import 'package:bankly/utils/app_color.dart';
import 'package:bankly/utils/app_componenet/padded.dart';
import 'package:bankly/utils/constants.dart';
import 'package:bankly/utils/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../utils/app_componenet/app_bar_custom.dart';

class TransactionPage extends StatefulHookWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(autoAdjustHeight(10)),
      borderSide: BorderSide.none,
    );
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: autoAdjustHeight(170),
            width: double.maxFinite,
            child: Padded(
              child: Column(
                children: [
                  Gap(autoAdjustHeight(61)),
                  const BanklyCustomAppBar(),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: autoAdjustHeight(45),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(autoAdjustHeight(10)),
                            boxShadow: [
                              BoxShadow(
                                color: kBLKCOLOUR.withOpacity(0.05),
                                blurRadius: autoAdjustHeight(2),
                                spreadRadius: autoAdjustHeight(1),
                              ),
                            ]),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            filled: true,
                            fillColor: kWHTCOLOUR,
                            hintStyle: kTextStyleCustom(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: kBLKLIGHTDeepColor,
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(
                                right: autoAdjustWidth(12),
                                top: autoAdjustHeight(10),
                                bottom: autoAdjustHeight(10),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: autoAdjustHeight(26),
                                  width: autoAdjustWidth(73),
                                  decoration: BoxDecoration(
                                    color: kSECCOLOUR,
                                    borderRadius: BorderRadius.circular(
                                      autoAdjustHeight(5),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Filter',
                                        style: kTextStyleCustom(
                                          fontSize: 12,
                                          color: kPRYCOLOUR,
                                        ),
                                      ),
                                      Gap(autoAdjustWidth(6)),
                                      SvgPicture.asset(
                                          'assests/svgs/fliter.svg')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  autoAdjustWidth(24),
                                  autoAdjustHeight(15),
                                  autoAdjustWidth(16),
                                  autoAdjustHeight(15)),
                              child:
                                  SvgPicture.asset('assests/svgs/Search.svg'),
                            ),
                            disabledBorder: outlineInputBorder,
                            enabledBorder: outlineInputBorder,
                            focusedBorder: outlineInputBorder,
                            focusedErrorBorder: outlineInputBorder,
                            border: outlineInputBorder,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          TabBar(
            controller: tabController,
            indicatorColor: kPRYCOLOUR,
            tabs: [
              Tab(
                child: Text(
                  'All',
                  style: kTextStyleCustom(
                    fontWeight: FontWeight.w500,
                    color: kBLKCOLOUR,
                    fontSize: 14,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Credit',
                  style: kTextStyleCustom(
                    fontWeight: FontWeight.w500,
                    color: kGreenSuccessfulCOLOR,
                    fontSize: 14,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Debit',
                  style: kTextStyleCustom(
                    fontWeight: FontWeight.w500,
                    color: kREDCOLOUR,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return TransactionSingleWidget();
                    },
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return TransactionSingleWidget();
                    },
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return TransactionSingleWidget();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionSingleWidget extends StatelessWidget {
  const TransactionSingleWidget({
    super.key,
  });

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
                const TransactionDetailsPage(),
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
                    color: kGreenBGCOLOR,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(autoAdjustHeight(9)),
                    child: SizedBox(
                      height: autoAdjustHeight(6),
                      width: autoAdjustWidth(6),
                      child: SvgPicture.asset('assests/svgs/moneyin.svg'),
                    ),
                  ),
                ),
                Gap(autoAdjustWidth(25)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transfer- charge',
                        style: kTextStyleCustom(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Gap(autoAdjustHeight(6)),
                      Text(
                        '23, Apr 2022, 12:00:32 PM',
                        style: kTextStyleCustom(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: kBLKLIGHTDeepColor),
                      ),
                    ],
                  ),
                ),
                Text(
                  '+₦130,630.00',
                  style: kTextStyleCustom(
                    fontWeight: FontWeight.w400,
                    color: kGreenSuccessfulCOLOR,
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
