import 'package:flutter/material.dart';
import 'package:flutter_getx_design_pattern/app/moduls/home/home_controller.dart';
import 'package:get/state_manager.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.brown,

          title: Text("Home Screen", style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              onPressed: () {
                controller.onLogout();
              },
              icon: Icon(Icons.logout_outlined),
            ),
          ],
        ),

        body: controller.loading.value == false
            ? Text("")
            : Center(child: CircularProgressIndicator(color: Colors.brown)),
      );
    });
  }
}
