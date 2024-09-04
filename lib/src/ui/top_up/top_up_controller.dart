import 'package:get/get.dart';

class TopUpController extends GetxController {
  var amount = '0.00'.obs;

  void onKeyTap(String value) {
    if (value == '<') {
      if (amount.isNotEmpty && amount.value.length > 1) {
        amount.value = amount.value.substring(0, amount.value.length - 1);
      } else {
        amount.value = '0.00';
      }
    } else if (value == '.') {
      if (!amount.value.contains('.')) {
        amount.value += value;
      }
    } else {
      if (amount.value == '0.00') {
        amount.value = value;
      } else {
        amount.value += value;
      }
    }
  }

  double getAmountAsDouble() {
    final cleanedAmount = amount.value.isEmpty ? '0.00' : amount.value;

    final normalizedAmount =
        cleanedAmount.contains('.') ? cleanedAmount : '$cleanedAmount.00';

    return double.tryParse(normalizedAmount) ?? 0.00;
  }
}
