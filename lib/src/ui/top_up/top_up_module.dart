import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:money_app/src/app_config/modules/module.dart';
import 'package:money_app/src/ui/top_up/top_up_bindings.dart';
import 'package:money_app/src/ui/top_up/top_up_page.dart';

class TopUpModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/homepage',
      page: () => const TopUpPage(),
      binding: TopUpBindings(),
    ),
  ];
}
