import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_design_pattern/app/moduls/post/post_controller.dart';
import 'package:get/get.dart';

class PostView extends GetView<PostController> {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown,
        title: Text("List Post", style: TextStyle(color: Colors.white)),
      ),
      body: Obx(() {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: controller.loading.value == true
              ? Center(
            child: CircularProgressIndicator(
              color: Colors.brown,
            ),
          )
              : ListView.builder(
            itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    var post = controller.list[index];
                    return Container(
                        child: Column(children: [
                          Image.network("${post.image}"),
                          Text("${post.title}"),
                        ]),
                    );
                  },
                ),
        );
      }),
    );
  }
}
