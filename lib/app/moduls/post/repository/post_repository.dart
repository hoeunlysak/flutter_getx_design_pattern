import 'dart:convert';

import 'package:flutter_getx_design_pattern/app/core/constants/constant_uri.dart';
import 'package:flutter_getx_design_pattern/app/core/models/post/Content.dart';
import 'package:flutter_getx_design_pattern/app/core/models/post/PostResponse.dart';
import 'package:flutter_getx_design_pattern/app/core/network/api_network_service.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

abstract class PostRepository {
  Future<List<Content>> getAllPost({
    String? page,
    String? limit,
    String? status,
  });
}
