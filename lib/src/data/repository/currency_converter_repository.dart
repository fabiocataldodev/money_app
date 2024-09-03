import 'package:money_app/src/data/models/currency_converer_model.dart';

abstract interface class CurrencyConverterRepository {
  Future<CurrencyConverterModel> getAllCurrency();
}
