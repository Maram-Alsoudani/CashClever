
class TransactionEntity{
  String id;
  String type;
  double amount;
  String category;
  DateTime time;
  String note;

  TransactionEntity({
    this.id="",
    required this.type,
    required this.amount,
    required this.category,
    required this.time,
    required this.note
});
}