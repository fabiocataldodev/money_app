import 'package:flutter_test/flutter_test.dart';
import 'package:money_app/src/data/repository/currency_converter_repository_impl.dart';

void main() {
  late CurrencyConverterRepositoryImpl repository;

  setUp(() {
    repository = CurrencyConverterRepositoryImpl();
  });

  group('CurrencyConverterRepository Integration Test', () {
    test('should return CurrencyConverterModel if the API call is successful',
        () async {
      final result = await repository.getAllCurrency();

      expect(result.rates, isNotEmpty);
      expect(result.rates.containsKey('USD'), isTrue);
      expect(result.rates.containsKey('EUR'), isTrue);
    });
  });
}
