import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_app/src/app_config/colors/app_colors.dart';
import './currency_converter_controller.dart';

class CurrencyConverterPage extends GetView<CurrencyConverterController> {
  const CurrencyConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Currency Converter',
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
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        final currencyFormat = NumberFormat('#,##0.00', 'en_US');

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixText: '£ ',
                      prefixStyle: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      labelText: 'Amount',
                      labelStyle: TextStyle(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.secondaryColor,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.secondaryColor,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.secondaryColor,
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      controller.baseAmount.value =
                          double.tryParse(value) ?? 0.0;
                    },
                  ),
                ).marginOnly(bottom: 64),
                DropdownButton<String>(
                  dropdownColor: AppColors.primaryColor,
                  iconEnabledColor: AppColors.secondaryColor,
                  value: controller.selectedCurrency.value.isEmpty
                      ? null
                      : controller.selectedCurrency.value,
                  hint: const Text(
                    'Select Currency',
                    style: TextStyle(
                        color: AppColors.secondaryColor, fontSize: 24),
                  ),
                  items: controller.currencies.keys.map((currency) {
                    final rate = controller.currencies[currency] ?? 0.0;
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(
                        '$currency - ${rate.toStringAsFixed(2)}',
                        style: const TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedCurrency.value = value;
                    }
                  },
                ).marginOnly(bottom: 64),
                Column(
                  children: [
                    const Text(
                      'Converted Amount:',
                      style: TextStyle(
                          color: AppColors.secondaryColor, fontSize: 24),
                    ),
                    Text(
                      currencyFormat.format(controller.convertedAmount.value),
                      style: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
