import 'package:money_app/src/data/models/currency_converer_model.dart';
import 'package:money_app/src/data/repository/currency_converter_repository.dart';
import './currency_converter_service.dart';

class CurrencyConverterServiceImpl implements CurrencyConverterService {
  final CurrencyConverterRepository _currencyConverterRepository;

  CurrencyConverterServiceImpl({
    required CurrencyConverterRepository currencyConverterRepository,
  }) : _currencyConverterRepository = currencyConverterRepository;

  @override
  Future<CurrencyConverterModel> getAllCurrency() async {
    try {
      return await _currencyConverterRepository.getAllCurrency();
    } catch (e) {
      throw Exception('Error getting data: $e');
    }
  }
}
