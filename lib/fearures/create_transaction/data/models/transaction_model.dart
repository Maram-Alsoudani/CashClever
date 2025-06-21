import 'package:CashClever/fearures/create_transaction/domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel(
      {super.id = "",
      required super.type,
      required super.amount,
      required super.category,
      required super.time,
      required super.note});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'amount': amount,
      'category': category,
      'time': time,
      'note': note
    };
  }

  TransactionModel.fromJson(Map<String, dynamic> json)
      : super(
            type: json["type"] as String,
            amount: json["amount"] as double,
            category: json["category"] as String,
            time: DateTime.fromMillisecondsSinceEpoch(json["time"]),
            note: json["note"] as String);
}
