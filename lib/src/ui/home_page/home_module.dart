import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:money_app/src/app_config/modules/module.dart';
import 'package:money_app/src/ui/home_page/home_bindings.dart';
import 'package:money_app/src/ui/home_page/home_page.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
