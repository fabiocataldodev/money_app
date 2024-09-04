import 'package:get/get.dart';
import 'package:money_app/src/data/service/currency_converter_service.dart';

class CurrencyConverterController extends GetxController {
  final CurrencyConverterService _currencyConverterService;

  CurrencyConverterController({
    required CurrencyConverterService currencyConverterService,
  }) : _currencyConverterService = currencyConverterService;

  var currencies = <String, double>{}.obs;
  var baseAmount = 0.0.obs;
  var convertedAmount = 0.0.obs;
  var selectedCurrency = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCurrencies();

    // Listen for changes in baseAmount and selectedCurrency
    ever(baseAmount, (_) => convertCurrency());
    ever(selectedCurrency, (_) => convertCurrency());

    // Initial conversion if both baseAmount and selectedCurrency are set
    if (baseAmount.value > 0 && selectedCurrency.value.isNotEmpty) {
      convertCurrency();
    }
  }

  Future<void> fetchCurrencies() async {
    isLoading(true);
    try {
      final result = await _currencyConverterService.getAllCurrency();
      currencies.value = result.rates;
    } catch (e) {
      errorMessage.value = 'Failed to fetch currencies: $e';
    } finally {
      isLoading(false);
    }
  }

  void convertCurrency() {
    if (currencies.isNotEmpty && selectedCurrency.value.isNotEmpty) {
      final rate = currencies[selectedCurrency.value] ?? 1.0;
      convertedAmount.value = baseAmount.value * rate;
    } else {
      convertedAmount.value = 0.0;
    }
  }
}
