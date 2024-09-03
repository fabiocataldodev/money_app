import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/src/app_config/colors/app_colors.dart';
import 'package:money_app/src/utils/custom_currency_text.dart';
import 'package:money_app/src/ui/payment_page/widgets/custom_elevated_button.dart';
import 'package:money_app/src/ui/payment_page/widgets/keyboard_widget.dart';
import 'package:money_app/src/ui/payment_page/widgets/to_who_widget.dart';
import 'payment_controller.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: Scaffold(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'How much?',
                style: TextStyle(
                    fontSize: 24.0,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold),
              ).marginOnly(bottom: 64),
              Obx(
                () => CustomCurrencyText(
                  amount: controller.getAmountAsDouble(),
                ).marginOnly(bottom: 64),
              ),
              Column(
                children: [
                  Row(
                    children: <Widget>[
                      KeyboardWidget(
                        number: '1',
                        onTap: () => controller.onKeyTap('1'),
                      ),
                      KeyboardWidget(
                        number: '2',
                        onTap: () => controller.onKeyTap('2'),
                      ),
                      KeyboardWidget(
                        number: '3',
                        onTap: () => controller.onKeyTap('3'),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      KeyboardWidget(
                        number: '4',
                        onTap: () => controller.onKeyTap('4'),
                      ),
                      KeyboardWidget(
                        number: '5',
                        onTap: () => controller.onKeyTap('5'),
                      ),
                      KeyboardWidget(
                        number: '6',
                        onTap: () => controller.onKeyTap('6'),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      KeyboardWidget(
                        number: '7',
                        onTap: () => controller.onKeyTap('7'),
                      ),
                      KeyboardWidget(
                        number: '8',
                        onTap: () => controller.onKeyTap('8'),
                      ),
                      KeyboardWidget(
                        number: '9',
                        onTap: () => controller.onKeyTap('9'),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      KeyboardWidget(
                        number: '.',
                        onTap: () => controller.onKeyTap('.'),
                      ),
                      KeyboardWidget(
                        number: '0',
                        onTap: () => controller.onKeyTap('0'),
                      ),
                      KeyboardWidget(
                        number: '<',
                        onTap: () => controller.onKeyTap('<'),
                      ),
                    ],
                  ),
                ],
              ).marginOnly(bottom: 64),
              CustomElevatedButton(
                text: 'Next',
                onPressed: () {
                  final amount = controller.getAmountAsDouble();
                  if (amount <= 0) {
                    Get.snackbar(
                      'Invalid Amount',
                      'The amount cannot be £ 0.00.',
                      backgroundColor: AppColors.secondaryColor,
                      colorText: AppColors.primaryColor,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    Get.to(() => const ToWhoWidget());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
