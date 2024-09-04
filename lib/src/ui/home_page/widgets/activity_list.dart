import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/src/app_config/colors/app_colors.dart';
import 'package:money_app/src/data/models/transaction_model.dart';
import 'package:money_app/src/ui/home_page/home_controller.dart';
import 'package:money_app/src/ui/home_page/widgets/transaction_item.dart';
import 'package:money_app/src/utils/format_utils.dart';

class ActivityList extends GetView<HomeController> {
  const ActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final transactions = controller.transactions;

        final groupedTransactions = <String, List<TransactionModel>>{};
        for (final transaction in transactions) {
          final formattedDate = FormatUtils.formatDate(transaction.date);
          if (groupedTransactions.containsKey(formattedDate)) {
            groupedTransactions[formattedDate]!.add(transaction);
          } else {
            groupedTransactions[formattedDate] = [transaction];
          }
        }

        final List<Widget> transactionWidgets = [];
        groupedTransactions.forEach((date, transactions) {
          const TextStyle headerStyle = TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: AppColors.blackScale4,
          );

          transactionWidgets.add(
            Container(
              width: double.infinity,
              color: AppColors.primaryBackground,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                date,
                style: headerStyle,
              ),
            ),
          );

          transactionWidgets.addAll(
            transactions.map((transaction) {
              return Dismissible(
                key: Key(transaction.id), // Use o id como chave
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  controller.deleteTransaction(transaction.id);
                },
                background: Container(
                  color: AppColors.warning,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                child: TransactionItem(transaction: transaction),
              );
            }).toList(),
          );
        });

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80.0),
            const Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ).marginOnly(left: 8, bottom: 16),
            Expanded(
              child: Container(
                color: AppColors.secondaryColor,
                child: transactionWidgets.isEmpty
                    ? const Center(
                        child: Text('No transactions yet!'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(0.0),
                        itemCount: transactionWidgets.length,
                        itemBuilder: (context, index) {
                          return transactionWidgets[index];
                        },
                      ),
              ),
            ),
          ],
        ).marginOnly(bottom: 16);
      }),
    );
  }
}
