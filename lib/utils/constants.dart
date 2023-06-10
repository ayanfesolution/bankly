import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import '../model/transaction_model.dart';
import 'app_color.dart';

TextStyle kTextStyleCustom({
  Color color = kBLKCOLOUR,
  double fontSize = 16,
  FontStyle fontStyle = FontStyle.normal,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return TextStyle(
    fontSize: autoAdjustHeight(fontSize),
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    color: color,
  );
}

kToastMsgPopUp(String msg, ToastGravity toastGravity) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: toastGravity,
    timeInSecForIosWeb: 2,
    backgroundColor: kPRYCOLOUR,
    textColor: Colors.white,
    fontSize: autoAdjustHeight(16),
  );
}

String kReturnTheTransactionName(TrnDrCr? data) {
  switch (data) {
    case TrnDrCr.DEPOSIT:
      return 'Deposit';
    case TrnDrCr.WITHDRAWAL:
      return 'Withdrawal';
    case TrnDrCr.INVOICE:
      return 'Invoice';
    case TrnDrCr.PAYMENT:
      return 'Payment';
    default:
      return '';
  }
}

String formatDateTwo(DateTime timeStamp) {
  return DateFormat('dd/MM/yyyy HH:mm:ss a').format(timeStamp);
}

String formatDateOne(DateTime timeStamp) {
  return DateFormat('dd, MMM yyyy, hh:mm:ss a').format(timeStamp);
}
