import 'package:flutter/material.dart';

class CustomCurrencyText extends StatelessWidget {
  final double amount;
  final String currencySymbol;
  final double amountFontSize;
  final double symbolFontSize;
  final double centsFontSize;

  const CustomCurrencyText({
    super.key,
    required this.amount,
    this.currencySymbol = '£',
    this.amountFontSize = 48.0,
    this.symbolFontSize = 24.0,
    this.centsFontSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedAmount = amount.toStringAsFixed(2);
    final int wholePart = int.parse(formattedAmount.split('.')[0]);
    final String decimalPart = formattedAmount.split('.')[1];

    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: currencySymbol,
            style: TextStyle(
              fontSize: symbolFontSize,
            ),
          ),
          TextSpan(
            text: wholePart.toString(),
            style: TextStyle(
              fontSize: amountFontSize,
            ),
          ),
          const TextSpan(
            text: '.',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          TextSpan(
            text: decimalPart,
            style: TextStyle(
              fontSize: centsFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
