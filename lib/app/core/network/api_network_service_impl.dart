import 'dart:convert';

import 'package:flutter_getx_design_pattern/app/core/constants/constant_uri.dart';
import 'package:flutter_getx_design_pattern/app/core/models/auth/LoginRequest.dart';
import 'package:flutter_getx_design_pattern/app/core/models/auth/LoginResponse.dart';
import 'package:flutter_getx_design_pattern/app/core/network/api_network_service.dart';
import 'package:http/http.dart' as httpCleint;

class ApiNetworkServiceImpl extends ApiNetworkService {
  //header
  var headers = {"Content-Type": "application/json"};
  @override
  Future<LoginResponse> login(LoginRequest req) async {
    LoginResponse loginResponse = LoginResponse();
    //url
    var url = Uri.parse(ConstantUri.loginPath);
    //call to api
    var response = await httpCleint.post(
      url,
      body: jsonEncode(req.toJson()),
      headers: headers,
    );
    //check condition status code
    if (response.statusCode == 401) {
      return loginResponse;
    }
    if (response.statusCode == 200) {
      //mapping Response
      loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
    }
    return loginResponse;
  }
}
