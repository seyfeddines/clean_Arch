import 'package:clean_arch/features/presentation/Screens/IntroScreen.dart';
import 'package:clean_arch/features/presentation/Screens/home_page.dart';
import 'package:clean_arch/features/presentation/getx/rootpages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double heghit = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // هنا نستخدم Get.put() لإنشاء متحكم UserController
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Introscreen(),
      getPages: rootPages.pages,
    );
  }
}

