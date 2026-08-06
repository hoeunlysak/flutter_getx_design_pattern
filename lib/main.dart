import 'package:flutter/material.dart';
import 'package:flutter_getx_design_pattern/app/core/network/api_network_service.dart';
import 'package:flutter_getx_design_pattern/app/core/network/api_network_service_impl.dart';
import 'package:flutter_getx_design_pattern/app/moduls/auth/login/login_binding.dart';
import 'package:flutter_getx_design_pattern/app/moduls/auth/login/login_view.dart';
import 'package:flutter_getx_design_pattern/app/moduls/auth/repository/auth_repository.dart';
import 'package:flutter_getx_design_pattern/app/moduls/auth/repository/auth_repository_impl.dart';
import 'package:flutter_getx_design_pattern/app/moduls/home/home_binding.dart';
import 'package:flutter_getx_design_pattern/app/moduls/home/home_view.dart';
import 'package:flutter_getx_design_pattern/app/moduls/post/post_binding.dart';
import 'package:flutter_getx_design_pattern/app/moduls/post/post_view.dart';
import 'package:flutter_getx_design_pattern/app/moduls/post/repository/post_repository.dart';
import 'package:flutter_getx_design_pattern/app/moduls/post/repository/post_repository_impl.dart';
import 'package:flutter_getx_design_pattern/app/moduls/splash/splash_binding.dart';
import 'package:flutter_getx_design_pattern/app/moduls/splash/splash_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.lazyPut<ApiNetworkService>(()=>ApiNetworkServiceImpl());
  Get.lazyPut<AuthRepository>(()=>AuthRepositoryImpl());
  Get.lazyPut<PostRepository>(()=>PostRepositoryImpl());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      //Generate Route
      getPages: [
        GetPage(name: "/", page: ()=>SplashView(), binding: SplashBinding(), transition: Transition.leftToRight),
        GetPage(name: "/home", page: ()=>HomeView(), binding: HomeBinding(), transition: Transition.leftToRight),
        GetPage(name: "/login", page: ()=>LoginView(), binding: LoginBinding(), transition: Transition.leftToRight),
        GetPage(name: "/posts", page: ()=>PostView(), binding: PostBinding(), transition: Transition.leftToRight)
      ],
    );
  }
}
