import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../datasource/datasources.dart';
import '../model/transaction_model.dart';

class TransactionsRepository {
  final TransactionDataSource transactionDataSource;

  TransactionsRepository(this.transactionDataSource);

  Future<List<TransactionsModelData>?> getTransactionDetails() async {
    final res = await transactionDataSource.getAllTransactions();
    List<TransactionsModelData>? result;
    if (res != null) {
      result = (res as List)
          .map((item) => TransactionsModelData.fromJson(item))
          .toList();
      if (kDebugMode) {
        print(result);
      }
      return result;
    } else {
      return null;
    }
  }
}
