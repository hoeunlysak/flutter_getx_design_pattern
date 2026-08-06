import 'package:flutter_getx_design_pattern/app/core/models/auth/LoginResponse.dart';

abstract class AuthRepository {
  Future<LoginResponse> login({String? username, String? password});
}