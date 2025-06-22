import 'package:CashClever/core/cache/shared_preferences.dart';
import 'package:CashClever/core/errors/failures.dart';
import 'package:CashClever/core/utils/firebase/firebase_utils.dart';
import 'package:CashClever/core/utils/strings.dart';
import 'package:CashClever/fearures/create_transaction/domain/entities/transaction_entity.dart';
import 'package:CashClever/fearures/home/data/data_sources/get_transaction_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../create_transaction/data/models/transaction_model.dart';
import '../../presentation/manager/cubit/home_cubit.dart';
@Injectable(as: GetTransactionsDataSource)
class GetTransactionsDataSourceImpl implements GetTransactionsDataSource {
  @override
  Stream<Either<Failure, List<TransactionEntity>>> getTransactions(TimeFilter filter) {
    try {
      var user = SharedPrefs.getData(key: AppStrings.loggedInUserKey);
      final uid = user?.id ?? "";

      Stream<List<TransactionModel>> transactionsList = FirebaseUtils.getTransactions(uid, filter);

      return transactionsList.map((models) {
        final entities = models.map((model) => model as TransactionEntity).toList();
        return Right(entities);
      });
    } catch (e) {
      return Stream.value(Left(Failure(errorMessage: e.toString())));
    }
  }
}


