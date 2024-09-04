import 'package:flutter/material.dart';
import 'package:money_app/src/app_config/colors/app_colors.dart';
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
        amountColor = AppColors.blackScale1;
        break;
      case TransactionType.topup:
        icon = Icons.add_circle;
        amountColor = AppColors.primaryColor;
        break;
    }

    final Map<String, String> formattedAmount =
        FormatUtils.formatAmount(transaction.amount);

    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primaryColor,
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
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: transaction.type == TransactionType.topup
                      ? '+ £${formattedAmount['integer']}'
                      : '£${formattedAmount['integer']}',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: amountColor,
                  ),
                ),
                TextSpan(
                  text: formattedAmount['decimal'],
                  style: TextStyle(
                    fontSize: 14.0,
                    color: amountColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
