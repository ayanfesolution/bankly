import 'dart:io';

import 'package:auto_adjust/auto_adjust.dart';
import 'package:bankly/screens/trasactions/trans_item_list.dart';
import 'package:bankly/utils/app_color.dart';
import 'package:bankly/utils/app_componenet/app_bar_custom.dart';
import 'package:bankly/utils/app_componenet/bankly_button.dart';
import 'package:bankly/utils/app_componenet/padded.dart';
import 'package:bankly/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../model/transaction_model.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({
    super.key,
    required this.dataToUse,
  });
  final TransactionsModelData dataToUse;

  @override
  Widget build(BuildContext context) {
    ScreenshotController screenshotController = ScreenshotController();
    Uint8List imageFile;

    Future<Uint8List> capturedTheReceiptWidget() {
      return screenshotController
          .captureFromWidget(
        Container(
            color: kWHTCOLOUR,
            height: autoAdjustHeight(550),
            padding: EdgeInsets.all(autoAdjustHeight(16)),
            child: Column(
              children: [
                Gap(autoAdjustHeight(31)),
                Container(
                  height: autoAdjustHeight(74),
                  width: autoAdjustWidth(74),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      autoAdjustHeight(37),
                    ),
                    color: kSECCOLOUR,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: autoAdjustWidth(21),
                        vertical: autoAdjustHeight(16)),
                    child: SvgPicture.asset('assests/svgs/banklyIcon.svg'),
                  ),
                ),
                Gap(autoAdjustHeight(20)),
                Text(
                  '${dataToUse.trnDrCr == TrnDrCr.DEPOSIT ? '+' : '-'}₦${dataToUse.trnAmount ?? ''}',
                  style: kTextStyleCustom(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gap(
                  autoAdjustHeight(70),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Details:',
                        style: kTextStyleCustom(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap(autoAdjustHeight(27)),
                      TranItemList(
                        infoName: 'Date and Time',
                        infoDetails: formatDateTwo(dataToUse.trnDate!),
                      ),
                      TranItemList(
                        infoName: 'Reference',
                        infoDetails: dataToUse.trnPaymentReference ?? '',
                        //showCopyButton: true,
                      ),
                      TranItemList(
                        infoName: 'Type',
                        infoDetails: dataToUse.trnDrCr == TrnDrCr.DEPOSIT
                            ? 'Credit'
                            : 'Debit',
                      ),
                      const TranItemList(
                        infoName: 'Balance',
                        infoDetails: '₦2,500.00',
                      ),
                      TranItemList(
                        infoName: 'Narration',
                        infoDetails: dataToUse.trnNarration ?? '',
                      ),
                    ],
                  ),
                ),
              ],
            )),
      )
          .then((capturedImage) {
        return capturedImage;
        // Handle captured image
      });
    }

    return Scaffold(
      body: Padded(
        child: Column(
          children: [
            Gap(autoAdjustHeight(57)),
            const BanklyCustomAppBar(
              shouldNavigate: true,
            ),
            Gap(autoAdjustHeight(31)),
            CircleAvatar(
              backgroundColor: kSECCOLOUR,
              maxRadius: autoAdjustHeight(37),
              child: SvgPicture.asset('assests/svgs/banklyIcon.svg'),
            ),
            Gap(autoAdjustHeight(20)),
            Text(
              '${dataToUse.trnDrCr == TrnDrCr.DEPOSIT ? '+' : '-'}₦${dataToUse.trnAmount ?? ''}',
              style: kTextStyleCustom(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(
              autoAdjustHeight(70),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Details:',
                    style: kTextStyleCustom(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gap(autoAdjustHeight(27)),
                  TranItemList(
                    infoName: 'Date and Time',
                    infoDetails: formatDateTwo(dataToUse.trnDate!),
                  ),
                  TranItemList(
                    infoName: 'Reference',
                    infoDetails: dataToUse.trnPaymentReference ?? '',
                    showCopyButton: true,
                  ),
                  TranItemList(
                    infoName: 'Type',
                    infoDetails: dataToUse.trnDrCr == TrnDrCr.DEPOSIT
                        ? 'Credit'
                        : 'Debit',
                  ),
                  const TranItemList(
                    infoName: 'Balance',
                    infoDetails: '₦2,500.00',
                  ),
                  TranItemList(
                    infoName: 'Narration',
                    infoDetails: dataToUse.trnNarration ?? '',
                  ),
                ],
              ),
            ),
            BanklyMainButton(
              text: 'DOWNLOAD RECEIPT',
              onTap: () async {
                Uint8List imageInUnit8List =
                    await capturedTheReceiptWidget(); // store unit8List image here ;
                // final tempDir = await getTemporaryDirectory();
                // File file =
                //     await File('${tempDir.path}/receiptdownload.png').create();
                // file.writeAsBytesSync(imageInUnit8List);
                // await ImageGallerySaver.saveFile(
                //   file.path,
                // );

                await ImageGallerySaver.saveImage(imageInUnit8List);
                kToastMsgPopUp('Receipt Saved in gallary', ToastGravity.TOP);
              },
            ),
            Gap(autoAdjustHeight(24)),
            InkWell(
              onTap: () async {
                imageFile = await capturedTheReceiptWidget();

                final directory = await getApplicationDocumentsDirectory();
                final imagePath =
                    await File('${directory.path}/receipt.png').create();
                await imagePath.writeAsBytes(imageFile);

                /// Share Plugin
                await Share.shareXFiles([
                  XFile(imagePath.path),
                ]);
              },
              child: Text(
                'Share With Bankly Assistant',
                style: kTextStyleCustom(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kPRYCOLOUR,
                ),
              ),
            ),
            Gap(autoAdjustHeight(31)),
          ],
        ),
      ),
    );
  }
}
