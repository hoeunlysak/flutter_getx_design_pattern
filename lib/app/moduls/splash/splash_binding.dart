import 'package:flutter_getx_design_pattern/app/moduls/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>SplashController());
  }
  
}
