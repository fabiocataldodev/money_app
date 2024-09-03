import 'package:flutter/material.dart';
import 'package:money_app/src/app_config/colors/app_colors.dart';

class KeyboardWidget extends StatelessWidget {
  final String number;
  final VoidCallback onTap;

  const KeyboardWidget({
    super.key,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                  fontSize: 28.0, color: AppColors.secondaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
