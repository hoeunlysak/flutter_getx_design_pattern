import 'package:flutter/material.dart';
import 'package:flutter_getx_design_pattern/app/moduls/auth/login/login_controller.dart';
import 'package:flutter_getx_design_pattern/app/moduls/widgets/custom_botton_widget.dart';
import 'package:flutter_getx_design_pattern/app/moduls/widgets/custom_input_widget.dart';
import 'package:get/state_manager.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.brown,
          centerTitle: true,
          title: Text("Login", style: TextStyle(color: Colors.white)),
        ),

        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputWidget(
                controller: controller.usernameController,
                label: "Username",
                hintText: "Username",
              ),
              CustomInputWidget(
                controller: controller.passwordController,
                label: "Password",
                hintText: "Password",
              ),

              SizedBox(height: 12),
              //Button
              CustomBottonWidget(
                label: "Login",
                loading: controller.loading.value,
                onClick: () {
                  controller.onLogin();
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
