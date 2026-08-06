import 'package:flutter_getx_design_pattern/app/core/models/post/Content.dart';
import 'package:flutter_getx_design_pattern/app/moduls/post/repository/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController{
  final postRepository = Get.find<PostRepository>();
  var loading = false.obs;
  var list = <Content>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getAllPost();
    super.onInit();
  }

  Future<void> getAllPost() async {
    loading.value =true;
    var response = await postRepository.getAllPost();
    if (response.isNotEmpty) {
      list.value = response;
    }
    loading.value = false;
  }
}