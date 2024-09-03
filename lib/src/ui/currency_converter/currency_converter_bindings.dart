import 'package:get/get.dart';
import './currency_converter_controller.dart';

class CurrencyConverterBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(CurrencyConverterController());
    }
}