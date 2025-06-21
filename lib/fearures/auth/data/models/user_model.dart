import 'package:CashClever/fearures/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity{

  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.balance,
    required super.expenses,
    required super.income,

  });
  // from dart obj to Json (json=map)
  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "name": name,
      "email":email,
      "balance": balance,
      "expenses": expenses,
      "income": income,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : super(
    id: json['id'],
    name:json['name'],
    email: json['email'],
    balance: json['balance'],
    expenses: json['expenses'],
    income: json['income'],
  );

  }



