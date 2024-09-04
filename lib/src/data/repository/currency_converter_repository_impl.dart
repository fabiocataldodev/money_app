import 'package:money_app/src/data/models/currency_converer_model.dart';
import 'package:money_app/src/data/repository/currency_converter_repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyConverterRepositoryImpl implements CurrencyConverterRepository {
  final String url = "https://open.er-api.com/v6/latest/GBP";

  @override
  Future<CurrencyConverterModel> getAllCurrency() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        if (result != null && result.containsKey('rates')) {
          return CurrencyConverterModel.fromJson(result);
        } else {
          throw Exception("Unexpected response format: 'rates' key not found");
        }
      } else {
        throw Exception(
            "Failed to load rates: ${response.statusCode} ${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception("Error occurred while fetching rates: $e");
    }
  }
}
