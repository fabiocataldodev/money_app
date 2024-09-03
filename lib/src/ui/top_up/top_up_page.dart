import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './top_up_controller.dart';

class TopUpPage extends GetView<TopUpController> {
    
    const TopUpPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('TopUpPage'),),
            body: Container(),
        );
    }
}