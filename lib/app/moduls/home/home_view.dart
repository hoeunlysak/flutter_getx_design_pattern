import 'package:flutter/material.dart';
import 'package:flutter_getx_design_pattern/app/moduls/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {

      return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.brown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 150,
              ),
              Column(
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.pop(context);
                      Get.toNamed("/posts");
                    },
                    leading: Icon(Icons.post_add, color: Colors.white,),
                    title: Text("List Post", style: TextStyle( color:Colors.white),),
                    trailing: Icon(Icons.navigate_next, color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
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
