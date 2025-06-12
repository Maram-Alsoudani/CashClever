import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:CashClever/fearures/auth/data/models/user_dto.dart';

class FirebaseUtils{
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  static CollectionReference<UserDTO>getUsersCollection(){
    return fireStore.collection("users").withConverter<UserDTO>(
        fromFirestore: (snapshot, _)=> UserDTO.fromJson(snapshot.data()!),
        toFirestore: (UserModel, _)=> UserModel.toJson());
  }

  static Future<void> addUser(UserDTO user){
    return getUsersCollection().doc(user.id).set(user);

  }

  static Future<UserDTO?> getUser(String id)async{
   var documentSnapshot= await getUsersCollection().doc(id).get();
    return documentSnapshot.data();
  }



}