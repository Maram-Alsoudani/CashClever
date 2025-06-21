import 'package:CashClever/core/cache/shared_preferences.dart';
import 'package:CashClever/core/errors/failures.dart';
import 'package:CashClever/core/utils/firebase/firebase_utils.dart';
import 'package:CashClever/fearures/create_transaction/data/data_sources/transactions_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/transaction_entity.dart';
import '../models/transaction_model.dart';
@Injectable(as: TransactionsDataSource)
class TransactionsDataSourceImpl extends TransactionsDataSource{
  @override
  Future<Either<Failure, void>> createTransaction(TransactionEntity transaction)async{
    final transactionModel=  TransactionModel(
        type: transaction.type,
        amount: transaction.amount,
        category: transaction.category,
        time: transaction.time,
        note: transaction.note);
    try{
      String? userId= SharedPrefs.getData(key:"LoggedInUser")?.id;
      if(userId == null){
        return Left(Failure(errorMessage: "User not logged in"));
      }
      await FirebaseUtils.createTransaction(transactionModel, userId);

      return Right(null);
    }catch(e){
      return Left(Failure(errorMessage: 'Failed to create transaction: ${e.toString()}'));

    }
  }

}