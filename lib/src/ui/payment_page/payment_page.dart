import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/src/app_config/colors/app_colors.dart';
import 'package:money_app/src/ui/payment_page/widgets/to_who_widget.dart';
import 'package:money_app/src/utils/amount_input_widget.dart';
import 'payment_controller.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AmountInputWidget(
        title: 'MoneyApp',
        questionText: 'How Much?',
        buttonText: 'Next',
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
          } else {
            Get.to(() => const ToWhoWidget());
          }
        },
        onKeyTap: controller.onKeyTap,
        getAmountAsDouble: controller.getAmountAsDouble);
  }
}
