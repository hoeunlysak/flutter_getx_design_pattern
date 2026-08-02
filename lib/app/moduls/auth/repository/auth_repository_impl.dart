import 'package:flutter_getx_design_pattern/app/core/models/auth/LoginRequest.dart';
import 'package:flutter_getx_design_pattern/app/core/models/auth/LoginResponse.dart';
import 'package:flutter_getx_design_pattern/app/core/network/api_network_service.dart';
import 'package:flutter_getx_design_pattern/app/moduls/auth/repository/auth_repository.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class AuthRepositoryImpl extends AuthRepository{
  final apiNetworkService = Get.find<ApiNetworkService>();
  @override
  Future<LoginResponse> login({String? username, String? password}) {
    LoginRequest request = LoginRequest(
      phoneNumber: username,
      password: password
    );
    return apiNetworkService.login(request);
  }
}