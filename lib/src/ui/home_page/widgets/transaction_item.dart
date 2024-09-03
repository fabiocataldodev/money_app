import 'package:flutter/material.dart';
import 'package:money_app/src/data/models/transaction_model.dart';
import 'package:money_app/src/utils/format_utils.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color amountColor;

    switch (transaction.type) {
      case TransactionType.purchase:
        icon = Icons.shopping_cart;
        amountColor = Colors.black;
        break;
      case TransactionType.topup:
        icon = Icons.add_circle;
        amountColor = Colors.green;
        break;
    }

    final String formattedAmount = FormatUtils.formatAmount(transaction.amount);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.purple,
            size: 32.0,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Text(
            transaction.type == TransactionType.topup
                ? '+$formattedAmount'
                : '£$formattedAmount',
            style: TextStyle(
              fontSize: 18.0,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }
}
