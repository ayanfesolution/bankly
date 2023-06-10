// import 'package:bankly/utils/constants.dart';
// import 'package:bankly/utils/module.dart';
// import 'package:dio/dio.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import '../datasource/datasources.dart';
// import '../model/transaction_model.dart';
// import '../utils/error_handling.dart';

// part 'transaction_event.dart';
// part 'transaction_state.dart';

// class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
//   TransactionBloc() : super(TransactionInitial()) {
//     print('response ihih');

//     final transactionRepository = getIt.get<TransactionDataSource>();
//     on<GetAllTransactionEvent>((event, emit) async {
//       // emit(TransactionInitial());
//       GetAllTransactionEvent(data: data.data);
//       final response = await transactionRepository.getAllTransactions();
//       if (kDebugMode) {
//         print('response done');
//       }
//       emit(TransactionSuccess(data: transactionsModelDataFromJson()));
//       // response.fold(
//       //   (err) => emit(TransactionError(error: err)),
//       //   (data) => emit(TransactionSuccess(
//       //       data: transactionsModelDataFromJson(response))),
//       // );

//       // print('response');

//       // emit(TransactionError(error: ex));
//       //}
//     });
//   }
// }
