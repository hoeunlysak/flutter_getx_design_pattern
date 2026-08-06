import 'dart:convert';

import 'package:flutter_getx_design_pattern/app/core/constants/constant_uri.dart';
import 'package:flutter_getx_design_pattern/app/core/models/auth/LoginRequest.dart';
import 'package:flutter_getx_design_pattern/app/core/models/auth/LoginResponse.dart';
import 'package:flutter_getx_design_pattern/app/core/models/auth/RefreshTokenRequest.dart';
import 'package:flutter_getx_design_pattern/app/core/network/api_network_service.dart';
import 'package:flutter_getx_design_pattern/app/data/access_token.dart';
import 'package:get/get.dart';
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

  @override
  Future<bool> refreshToken() async {
    LoginResponse loginResponse = LoginResponse();
    //url
    var url = Uri.parse(ConstantUri.refreshPath);
    //call to api
    var response = await httpCleint.post(
      url,
      body: jsonEncode(
        RefreshTokenRequest(refreshToken: AccessToken.getRefreshToken()),
      ),
      headers: headers,
    );
    //check condition status code
    if (response.statusCode == 401) {
      AccessToken.removeToken();
      Get.offNamed("/login");
      return false;
    }
    if (response.statusCode == 200) {
      //mapping Response
      loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      AccessToken.saveToken(
        token: loginResponse.accessToken,
        refresh: loginResponse.refreshToken,
        username: loginResponse.user?.username,
      );
    }
    return true;
  }

  @override
  Future<dynamic> get(String uri) async {
    dynamic responseBody;

    //url
    var url = Uri.parse(uri);
    //call to api
    headers["Authorization"] = "Bearer ${AccessToken.getToken()}";
    var response = await httpCleint.get(url, headers: headers);
    if (response.statusCode == 200) {
      responseBody = response.body;
    }
    if (response.statusCode == 401) {
      if (await refreshToken() == true) {
        headers["Authorization"] = "Bearer ${AccessToken.getToken()}";
        var retryResponse = await httpCleint.get(url, headers: headers);
        if (response.statusCode == 200) {
          responseBody = retryResponse.body;
        }
      }
    }
    return responseBody;
  }
}
