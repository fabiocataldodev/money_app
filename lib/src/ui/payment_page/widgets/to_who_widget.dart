import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/src/app_config/colors/app_colors.dart';
import 'package:money_app/src/data/models/transaction_model.dart';
import 'package:money_app/src/ui/payment_page/payment_controller.dart';
import 'package:money_app/src/ui/home_page/home_controller.dart';
import 'package:money_app/src/ui/payment_page/widgets/custom_elevated_button.dart';

class ToWhoWidget extends GetView<PaymentController> {
  const ToWhoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'MoneyApp',
          style: TextStyle(
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: AppColors.secondaryColor,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.close,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
              ),
            ).marginOnly(right: 16),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text(
                'To Who?',
                style: TextStyle(
                  fontSize: 24.0,
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ).marginOnly(bottom: 64),
              TextField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  controller.toWho.value = value;
                },
              ).marginOnly(bottom: 64, left: 32, right: 32),
              CustomElevatedButton(
                text: 'Pay',
                onPressed: () {
                  final toWho = controller.toWho.value.trim();
                  final amount = controller.amount.value;

                  if (toWho.isEmpty) {
                    Get.snackbar(
                      'Missing Information',
                      'Please enter a recipient name.',
                      backgroundColor: AppColors.secondaryColor,
                      colorText: AppColors.primaryColor,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return;
                  }

                  final newTransaction = TransactionModel(
                    type: TransactionType.purchase,
                    title: toWho,
                    amount: amount,
                    date: DateTime.now(),
                  );

                  homeController.addTransaction(newTransaction);
                  controller.amount.value = '0.00';
                  controller.toWho.value = '';

                  Get.offAndToNamed('/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
