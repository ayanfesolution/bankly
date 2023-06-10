import 'package:fluttertoast/fluttertoast.dart';

import '../api/api_client.dart';
import '../utils/constants.dart';
import '../utils/error_handling.dart';
import 'endpionts.dart';

class TransactionDataSource {
  TransactionDataSource(this.client);
  final ApiClient client;

  Future<dynamic> getAllTransactions() async {
    try {
      client.header = {'Accept': '*/*'};
      final result = await client.get(Endpoints.transactionList);
      final output = result.data;
     // print(output);
      return output;
    } catch (e) {
      kToastMsgPopUp(
        NetworkExceptions.getDioException(e),
        ToastGravity.SNACKBAR,
      );
      rethrow;
    }
  }
}
