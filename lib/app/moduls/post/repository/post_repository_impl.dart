import 'dart:convert';

import 'package:flutter_getx_design_pattern/app/moduls/post/repository/post_repository.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../../core/constants/constant_uri.dart';
import '../../../core/models/post/Content.dart';
import '../../../core/models/post/PostResponse.dart';
import '../../../core/network/api_network_service.dart';

class PostRepositoryImpl extends PostRepository{
  final apiNetworkService = Get.find<ApiNetworkService>();
  @override
  Future<List<Content>> getAllPost({String? page, String? limit, String? status}) async {
    List<Content> list = [];
    var responseBody = await apiNetworkService.get(
        "${ConstantUri.listPostPath}?page=${page??0}&size=${limit??10}&status=${status?? 'ACT'}"
    );
    if (responseBody != null) {
      PostResponse postResponse = PostResponse.fromJson(jsonDecode(responseBody));
      if (postResponse.data != null && postResponse.data!.content!.isNotEmpty) {
        list = postResponse.data!.content ?? [];
      }
    }
    return list;
  }
}