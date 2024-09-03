import 'package:intl/intl.dart';

class FormatUtils {
  static String formatAmount(dynamic amount) {
    try {
      final NumberFormat amountFormatter = NumberFormat('#,##0.00', 'en_US');

      if (amount is String) {
        return amountFormatter.format(double.parse(amount));
      }

      if (amount is double) {
        return amountFormatter.format(amount);
      }

      throw const FormatException('Invalid amount format');
    } catch (e) {
      return '0.00';
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
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    }
  }
}
