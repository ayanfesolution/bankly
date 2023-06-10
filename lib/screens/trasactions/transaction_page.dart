import 'package:auto_adjust/auto_adjust.dart';
import 'package:bankly/provider/transaction_provider.dart';
import 'package:bankly/screens/trasactions/tran_single_widget.dart';
import 'package:bankly/utils/app_color.dart';
import 'package:bankly/utils/app_componenet/padded.dart';
import 'package:bankly/utils/constants.dart';
import 'package:bankly/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/transaction_model.dart';
import '../../utils/app_componenet/app_bar_custom.dart';

class TransactionPage extends StatefulHookConsumerWidget {
  const TransactionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionPageState();
}

class _TransactionPageState extends ConsumerState<TransactionPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isItDoneLoading = false;

  @override
  void initState() {
    action();

    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  action() async {
    bool loadingState =
        await ref.read(transactionProvider.notifier).getAllTheTransactionList();

    setState(() {
      isItDoneLoading = loadingState;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TransactionsModelData> transactionDataHistory =
        ref.watch(transactionProvider);
    List<TransactionsModelData> creditTransactionDataHistory =
        transactionDataHistory
            .where(
              (element) => element.trnDrCr == TrnDrCr.DEPOSIT,
            )
            .toList();
    List<TransactionsModelData> debitTransactionDataHistory =
        transactionDataHistory
            .where(
              (element) =>
                  element.trnDrCr == TrnDrCr.PAYMENT ||
                  element.trnDrCr == TrnDrCr.WITHDRAWAL ||
                  element.trnDrCr == TrnDrCr.INVOICE,
            )
            .toList();
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(autoAdjustHeight(10)),
      borderSide: BorderSide.none,
    );
    var serachFliterText = useTextEditingController();
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
                          controller: serachFliterText,
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
                                onTap: () {
                                  ref
                                      .read(transactionProvider.notifier)
                                      .filterList(serachFliterText.text);
                                },
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
          isItDoneLoading
              ? Expanded(
                  child: Padded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: transactionDataHistory.length,
                          itemBuilder: (context, index) {
                            TransactionsModelData dataToUse =
                                transactionDataHistory[index];
                            return TransactionSingleWidget(
                              dataToUse: dataToUse,
                            );
                          },
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: creditTransactionDataHistory.length,
                          itemBuilder: (context, index) {
                            TransactionsModelData dataToUse =
                                creditTransactionDataHistory[index];
                            return TransactionSingleWidget(
                              dataToUse: dataToUse,
                            );
                          },
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: debitTransactionDataHistory.length,
                          itemBuilder: (context, index) {
                            TransactionsModelData dataToUse =
                                debitTransactionDataHistory[index];
                            return TransactionSingleWidget(
                              dataToUse: dataToUse,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : const CXSpinner()
        ],
      ),
    );
  }
}
