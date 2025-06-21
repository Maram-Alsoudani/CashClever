import 'package:CashClever/fearures/create_transaction/data/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:CashClever/fearures/auth/data/models/user_model.dart';

class FirebaseUtils {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  static CollectionReference<UserModel> getUsersCollection() {
    return fireStore.collection("users").withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (userModel, _) => userModel.toJson());
  }

  static CollectionReference<TransactionModel> getTransactionsCollection(String userId) {
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

  static Future<void> createTransaction(TransactionModel transaction, String userId) {
    //1- create collection 2- create doc 3- set id of doc to id of transaction to be auto generated
var transactionCollection= getTransactionsCollection(userId);
DocumentReference<TransactionModel> transactionDocRef= transactionCollection.doc();
   transaction.id= transactionDocRef.id;
   return transactionDocRef.set(transaction);

  }

  static Future<UserModel?> getUser(String id) async {
    var documentSnapshot = await getUsersCollection().doc(id).get();
    return documentSnapshot.data();
  }
}
