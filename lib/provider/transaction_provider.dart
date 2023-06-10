import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/transaction_model.dart';
import '../repository/transaction_repo.dart';
import '../utils/module.dart';

final transactionProvider =
    StateNotifierProvider<TransactionProvider, List<TransactionsModelData>>(
        (ref) => TransactionProvider());

class TransactionProvider extends StateNotifier<List<TransactionsModelData>> {
  TransactionProvider() : super([]);

  final transactionRepository = getIt.get<TransactionsRepository>();

  Future<bool> getAllTheTransactionList() async {
    final response = await transactionRepository.getTransactionDetails();
    if (response != null) {
      state = response;
    }
    return true;
  }

  Future<bool> filterList(String letter) async {
    final response = await transactionRepository.getTransactionDetails();
    state = response!
        .where(
          (element) =>
              element.trnNarration!.contains(letter) ||
              element.trnAmount!.contains(letter) ||
              element.trnCounterPartyService!.contains(letter) ||
              element.trnPaymentReference!.contains(letter) ||
              element.trnDrCr.toString().contains(letter),
        )
        .toList();
    return true;
  }
}
