import 'package:flutter/material.dart';
import 'package:flutter_getx_design_pattern/app/moduls/splash/splash_controller.dart';
import 'package:get/state_manager.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.brown,
        body: controller.loading.value == false
            ? Text('')
            : Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    });
  }
}
