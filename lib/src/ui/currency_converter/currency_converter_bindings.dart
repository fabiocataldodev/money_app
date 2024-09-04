import 'package:get/get.dart';
import 'package:money_app/src/data/repository/currency_converter_repository.dart';
import 'package:money_app/src/data/repository/currency_converter_repository_impl.dart';
import 'package:money_app/src/data/service/currency_converter_service.dart';
import 'package:money_app/src/data/service/currency_converter_service_impl.dart';
import './currency_converter_controller.dart';

class CurrencyConverterBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<CurrencyConverterRepository>(
      CurrencyConverterRepositoryImpl(),
    );

    Get.put<CurrencyConverterService>(
      CurrencyConverterServiceImpl(
        currencyConverterRepository: Get.find<CurrencyConverterRepository>(),
      ),
    );

    Get.put<CurrencyConverterController>(
      CurrencyConverterController(
        currencyConverterService: Get.find<CurrencyConverterService>(),
      ),
    );
  }
}
