import 'package:intl/intl.dart';

class FormatUtils {
  static Map<String, String> formatAmount(dynamic amount) {
    try {
      final NumberFormat amountFormatter = NumberFormat('#,##0.00', 'en_UK');
      String formattedAmount;

      if (amount is String) {
        formattedAmount = amountFormatter.format(double.parse(amount));
      } else if (amount is double) {
        formattedAmount = amountFormatter.format(amount);
      } else {
        throw const FormatException('Invalid amount format');
      }

      final parts = formattedAmount.split('.');
      return {
        'integer': parts[0],
        'decimal': parts.length > 1 ? '.${parts[1]}' : '',
      };
    } catch (e) {
      return {'integer': '0', 'decimal': '.00'};
    }
  }

  static String formatDate(DateTime date) {
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today';
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Yesterday';
    } else {
      final DateFormat formatter = DateFormat('d MMMM');
      return formatter.format(date);
    }
  }
}
