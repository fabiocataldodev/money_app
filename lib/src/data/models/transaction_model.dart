import 'package:uuid/uuid.dart';

enum TransactionType {
  purchase,
  topup,
}

class TransactionModel {
  final String id;
  final TransactionType type;
  final String title;
  final String amount;
  final DateTime date;

  TransactionModel({
    String? id,
    required this.type,
    required this.title,
    required this.amount,
    required this.date,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.index,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      type: TransactionType.values[map['type']],
      title: map['title'],
      amount: map['amount'],
      date: DateTime.parse(map['date']),
    );
  }
}
