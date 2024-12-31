import 'package:clean_arch/features/presentation/Screens/IntroScreen.dart';
import 'package:clean_arch/features/presentation/Screens/home_page.dart';
import 'package:clean_arch/features/presentation/Screens/login_page.dart';
import 'package:clean_arch/features/presentation/getx/Mybindings.dart';
import 'package:get/get.dart';
class rootPages{
  static List<GetPage> pages =[
    GetPage(name: '/', page:()=> LoginPage()),
    GetPage(name: '/intro', page:()=> Introscreen()),
    GetPage(name: '/HomePage', page:()=> Home_page(),binding: Mybindings()),
  ];
}