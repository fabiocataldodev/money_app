import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/src/app_config/colors/app_colors.dart';
import 'package:money_app/src/ui/home_page/home_controller.dart';
import 'package:money_app/src/ui/home_page/widgets/activity_list.dart';
import 'package:money_app/src/utils/custom_currency_text.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onTap: controller.onIconPressed,
            onLongPress: controller.onIconLongPress,
            child: Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: const Icon(
                Icons.currency_exchange,
                color: AppColors.secondaryColor,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.primaryBackground,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                color: AppColors.primaryColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          return CustomCurrencyText(
                            amount: controller.initialAmount.value,
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 65.0),
                  ],
                ),
              ),
              const ActivityList(),
            ],
          ),
          Positioned(
            top: 100.0,
            left: 16.0,
            right: 16.0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackScale1.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed('/paymentPage'),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/pay_icon.png',
                          width: 60.0,
                          height: 60.0,
                        ),
                        const Text(
                          'Pay',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.blackScale1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed('/topUpPage'),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/wallet_icon.png',
                          width: 60.0,
                          height: 60.0,
                        ),
                        const Text(
                          'Top up',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.blackScale1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
