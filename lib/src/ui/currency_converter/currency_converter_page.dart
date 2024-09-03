import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './currency_converter_controller.dart';

class CurrencyConverterPage extends GetView<CurrencyConverterController> {
  const CurrencyConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CurrencyConverterPage'),
      ),
      body: Container(),
    );
  }
}
