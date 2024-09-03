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
          transactionWidgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                date,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );

          transactionWidgets.addAll(
            transactions.map((transaction) {
              return Dismissible(
                key: Key(transaction.date.toIso8601String()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  final index = transactions.indexOf(transaction);
                  if (index != -1) {
                    controller.deleteTransaction(index);
                  }
                },
                background: Container(
                  color: Colors.red,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
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

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80.0),
              const Text(
                'Recent Activity',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                color: AppColors.secondaryColor,
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  shrinkWrap: true,
                  children: transactionWidgets.isEmpty
                      ? [
                          const Center(
                            child: Text('No transactions available'),
                          ),
                        ]
                      : transactionWidgets,
                ),
              ),
            ],
          ),
        ).marginOnly(bottom: 16);
      }),
    );
  }
}
