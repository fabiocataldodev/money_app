import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);

    // Get.lazyPut<LoginService>(
    //     () => LoginServiceImpl(
    //           loginRepository: Get.find(),
    //         ),
    //     fenix: true);

    // Get.lazyPut<UserRepository>(() => UserRepositoryImpl(), fenix: true);
    // Get.lazyPut<UserService>(() => UserServiceImpl(userRepository: Get.find()),
    //     fenix: true);
    // Get.lazyPut<OnBoardingController>(() => OnBoardingController(),
    //     fenix: true);

    // Get.lazyPut<ForgotPasswordController>(
    //     () => ForgotPasswordController(forgotPasswordService: Get.find()),
    //     fenix: true);

    // Get.lazyPut<ForgotPasswordRepository>(() => ForgotPasswordRepositoryImpl(),
    //     fenix: true);
    // Get.lazyPut<ForgotPasswordService>(
    //     () => ForgotPasswordServiceImpl(forgotPasswordRepository: Get.find()),
    //     fenix: true);
  }
}
