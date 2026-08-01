import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_design_pattern/app/data/access_token.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var loading = false.obs;

  Future<void> onLogin() async {
    var username = usernameController.value.text;
    var password = passwordController.value.text;
    if (username.isEmpty) {
      Get.snackbar("Error", "Username is required");
      return;
    }
    if (password.isEmpty) {
      Get.snackbar("Error", "Password is required");
      return;
    }
    loading.value = true;
    await Future.delayed(Duration(seconds: 2));
    //loading.value = false;
    AccessToken.saveToken(
      username: username,
      token: "TOKEN",
      refresh: "REFRESH",
    );
    Get.offNamed("/home");
  }
}
