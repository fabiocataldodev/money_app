import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_app/src/app_config/theme/app_theme.dart';
import 'package:money_app/src/ui/currency_converter/currency_converter_bindings.dart';
import 'package:money_app/src/ui/currency_converter/currency_converter_module.dart';
import 'package:money_app/src/ui/home_page/home_module.dart';
import 'package:money_app/src/ui/payment_page/payment_module.dart';
import 'package:money_app/src/ui/top_up/top_up_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        return Theme(
          data: AppTheme.lightTheme,
          child: widget!,
        );
      },
      initialBinding: CurrencyConverterBindings(),
      title: 'Flutter Demo',
      getPages: [
        ...HomeModule().routers,
        ...PaymentModule().routers,
        ...CurrencyConverterModule().routers,
        ...TopUpModule().routers,
      ],
    );
  }
}
