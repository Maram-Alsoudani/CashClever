import 'package:CashClever/core/errors/failures.dart';
import 'package:CashClever/fearures/create_transaction/domain/entities/transaction_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/cache/shared_preferences.dart';
import '../../../../core/utils/firebase/firebase_utils.dart';
import '../../../../core/utils/strings.dart';
import 'get_all_transactions_data_source.dart';
@Injectable(as: GetTransactionsByTypeDataSource)

class GetTransactionsByTypeDataSourceImpl implements GetTransactionsByTypeDataSource{
  @override
  Stream<Either<Failure, List<TransactionEntity>>> getTransactionsByType(TypeFilter filter) {
    try {
      var user = SharedPrefs.getData(key: AppStrings.loggedInUserKey);
      final uid = user?.id ?? "";

      Stream<List<TransactionEntity>> transactionsList = FirebaseUtils.getTransactionsByType(uid, filter);

      return transactionsList.map((models) {
        final entities = models.map((model) => model).toList();
        return Right(entities);
      });
    } catch (e) {
      return Stream.value(Left(Failure(errorMessage: e.toString())));
    }
  }

}