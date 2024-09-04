import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/src/app_config/colors/app_colors.dart';
import 'package:money_app/src/utils/custom_currency_text.dart';
import 'package:money_app/src/ui/payment_page/widgets/custom_elevated_button.dart';
import 'package:money_app/src/ui/payment_page/widgets/keyboard_widget.dart';

class AmountInputWidget extends StatelessWidget {
  final String title;
  final String questionText;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final Function(String) onKeyTap;
  final double Function() getAmountAsDouble;

  const AmountInputWidget({
    super.key,
    required this.title,
    required this.questionText,
    required this.buttonText,
    required this.onButtonPressed,
    required this.onKeyTap,
    required this.getAmountAsDouble,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          title,
          style: const TextStyle(
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
            Text(
              questionText,
              style: const TextStyle(
                fontSize: 24.0,
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ).marginOnly(bottom: 64),
            Obx(
              () => CustomCurrencyText(
                amount: getAmountAsDouble(),
              ).marginOnly(bottom: 64),
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    KeyboardWidget(
                      number: '1',
                      onTap: () => onKeyTap('1'),
                    ),
                    KeyboardWidget(
                      number: '2',
                      onTap: () => onKeyTap('2'),
                    ),
                    KeyboardWidget(
                      number: '3',
                      onTap: () => onKeyTap('3'),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    KeyboardWidget(
                      number: '4',
                      onTap: () => onKeyTap('4'),
                    ),
                    KeyboardWidget(
                      number: '5',
                      onTap: () => onKeyTap('5'),
                    ),
                    KeyboardWidget(
                      number: '6',
                      onTap: () => onKeyTap('6'),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    KeyboardWidget(
                      number: '7',
                      onTap: () => onKeyTap('7'),
                    ),
                    KeyboardWidget(
                      number: '8',
                      onTap: () => onKeyTap('8'),
                    ),
                    KeyboardWidget(
                      number: '9',
                      onTap: () => onKeyTap('9'),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    KeyboardWidget(
                      number: '.',
                      onTap: () => onKeyTap('.'),
                    ),
                    KeyboardWidget(
                      number: '0',
                      onTap: () => onKeyTap('0'),
                    ),
                    KeyboardWidget(
                      number: '<',
                      onTap: () => onKeyTap('<'),
                    ),
                  ],
                ),
              ],
            ).marginOnly(bottom: 64),
            CustomElevatedButton(
              text: buttonText,
              onPressed: onButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
