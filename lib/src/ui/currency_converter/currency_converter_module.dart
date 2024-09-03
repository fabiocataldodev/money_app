import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:money_app/src/app_config/modules/module.dart';
import 'package:money_app/src/ui/currency_converter/currency_converter_bindings.dart';
import 'package:money_app/src/ui/currency_converter/currency_converter_page.dart';

class CurrencyConverterModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/currencyConverter',
      page: () => const CurrencyConverterPage(),
      binding: CurrencyConverterBindings(),
    ),
  ];
}
