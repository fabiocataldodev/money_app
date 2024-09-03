import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:money_app/src/app_config/modules/module.dart';
import 'package:money_app/src/ui/payment_page/payment_bindings.dart';
import 'package:money_app/src/ui/payment_page/payment_page.dart';

class PaymentModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/paymentPage',
      page: () => const PaymentPage(),
      binding: PaymentBindings(),
    ),
  ];
}
