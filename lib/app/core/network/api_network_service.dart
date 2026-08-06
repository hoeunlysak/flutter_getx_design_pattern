import 'package:flutter_getx_design_pattern/app/core/models/auth/LoginRequest.dart';
import 'package:flutter_getx_design_pattern/app/core/models/auth/LoginResponse.dart';

abstract class ApiNetworkService {
  Future<LoginResponse> login(LoginRequest req);
  Future<bool> refreshToken();
  Future<dynamic> get(String uri);
}