class TransactionModel {
  final TransactionType type;
  final String title;
  final String amount;
  final DateTime date;

  TransactionModel({
    required this.type,
    required this.title,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type.toString(),
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      type:
          TransactionType.values.firstWhere((e) => e.toString() == map['type']),
      title: map['title'],
      amount: map['amount'],
      date: DateTime.parse(map['date']),
    );
  }
}

enum TransactionType {
  purchase,
  topup,
}
