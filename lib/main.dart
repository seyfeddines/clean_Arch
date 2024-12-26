import 'package:clean_arch/core/database/cach/chachFluterSecureStorage.dart';
import 'package:clean_arch/features/presentation/Screens/IntroScreen.dart';
import 'package:clean_arch/features/presentation/Screens/login_page.dart';
import 'package:clean_arch/features/presentation/Screens/userSecren.dart';
import 'package:clean_arch/features/presentation/getx/userControler.dart';
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
    // هنا نستخدم Get.put() لإنشاء متحكم UserController
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Introscreen(),
    );
  }
}

