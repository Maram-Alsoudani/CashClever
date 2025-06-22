import 'package:CashClever/fearures/create_transaction/data/models/transaction_model.dart';
import 'package:CashClever/fearures/create_transaction/domain/entities/transaction_entity.dart';
import 'package:CashClever/fearures/home/presentation/manager/cubit/home_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:CashClever/fearures/auth/data/models/user_model.dart';

class FirebaseUtils {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  static CollectionReference<UserModel> getUsersCollection() {
    return fireStore.collection("users").withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (userModel, _) => userModel.toJson());
  }

  static CollectionReference<TransactionModel> getTransactionsCollection(
      String userId) {
    return fireStore
        .collection("users")
        .doc(userId)
        .collection("transactions")
        .withConverter<TransactionModel>(
        fromFirestore: (snapshot, _) =>
            TransactionModel.fromJson(snapshot.data()!),
        toFirestore: (transactionModel, _) => transactionModel.toJson());
  }

  static Future<void> addUser(UserModel user) {
    return getUsersCollection().doc(user.id).set(user);
  }

  static Future<void> createTransaction(TransactionModel transaction,
      String userId) {
    //1- create collection 2- create doc 3- set id of doc to id of transaction to be auto generated
    var transactionCollection = getTransactionsCollection(userId);
    DocumentReference<
        TransactionModel> transactionDocRef = transactionCollection.doc();
    transaction.id = transactionDocRef.id;
    return transactionDocRef.set(transaction);
  }

  static Future<UserModel?> getUser(String id) async {
    var documentSnapshot = await getUsersCollection().doc(id).get();
    return documentSnapshot.data();
  }

static Stream<List<TransactionModel>> getTransactions(String uid, TimeFilter filter)  {

    final now = DateTime.now();
    DateTime? startDate;

    if(filter == TimeFilter.today){
      startDate = DateTime(now.year, now.month, now.day);
    }else if(filter == TimeFilter.week){
      int daysSinceSaturday = (now.weekday % 7 + 1) % 7;
      DateTime saturday = now.subtract(Duration(days: daysSinceSaturday));
      startDate = DateTime(saturday.year, saturday.month, saturday.day);
    }else if(filter == TimeFilter.month){
      startDate = DateTime(now.year, now.month, 1);
    }

    
    CollectionReference<TransactionModel> transactions =
    FirebaseUtils.getTransactionsCollection(uid);
    return transactions.where('time', isGreaterThanOrEqualTo: startDate).orderBy(
        'time', descending: true)
        .snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        var data = doc.data();
        return TransactionModel(
            type: data.type,
            amount: data.amount,
            category: data.category,
            time: data.time,
            note: data.note);
      }).toList();
    });
  }



}
