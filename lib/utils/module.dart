import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../api/api_client.dart';
import '../datasource/datasources.dart';
import '../repository/transaction_repo.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt
    ..registerLazySingleton<ApiClient>(() => ApiClient(getIt()))
    ..registerLazySingleton<Dio>(Dio.new)
    ..registerLazySingleton<TransactionsRepository>(
        () => TransactionsRepository(getIt()))
    ..registerLazySingleton<TransactionDataSource>(
        () => TransactionDataSource(getIt()));
}
