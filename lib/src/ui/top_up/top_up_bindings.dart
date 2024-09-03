import 'package:get/get.dart';
import './top_up_controller.dart';

class TopUpBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(TopUpController());
    }
}