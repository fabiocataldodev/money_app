import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_app/src/app_config/colors/app_colors.dart';
import 'package:money_app/src/data/models/transaction_model.dart';
import 'package:money_app/src/ui/home_page/home_controller.dart';
import 'package:money_app/src/utils/amount_input_widget.dart';
import './top_up_controller.dart';

class TopUpPage extends GetView<TopUpController> {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return AmountInputWidget(
        title: 'MoneyApp',
        questionText: 'How Much?',
        buttonText: 'Top Up',
        onButtonPressed: () {
          final amount = controller.amount.value;

          if (amount == '0.00') {
            Get.snackbar(
              'Missing Information',
              'The amount cannot be £0.00.',
              backgroundColor: AppColors.secondaryColor,
              colorText: AppColors.primaryColor,
              snackPosition: SnackPosition.BOTTOM,
            );
            return;
          }

          final newTransaction = TransactionModel(
            type: TransactionType.topup,
            title: 'Top up',
            amount: amount,
            date: DateTime.now(),
          );

          homeController.addTransaction(newTransaction);
          controller.amount.value = '0.00';

          Get.offAllNamed('/');
        },
        onKeyTap: controller.onKeyTap,
        getAmountAsDouble: controller.getAmountAsDouble);
  }
}
