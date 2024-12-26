
import 'package:animated_introduction/animated_introduction.dart';
import 'package:clean_arch/features/presentation/Screens/IntroScreen.dart';
import 'package:clean_arch/features/presentation/Screens/login_page.dart';
import 'package:clean_arch/features/presentation/Screens/userSecren.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
final List<SingleIntroScreen> pages = [
  const SingleIntroScreen(
    title: 'Shop Smarter, Live Better',
    description: 'Experience a curated shopping journey with deals tailored to your needs.',
    imageAsset: 'images/undraw_shopping-app_b80f (1).png',
    mainCircleBgColor: Colors.transparent, // Keeping it clean
  ),
  const SingleIntroScreen(
    title: 'Explore Unlimited Choices',
    description: 'From daily essentials to unique finds, everything you want is just a tap away.',
    imageAsset: 'images/undraw_online-groceries_n03y.png',
    mainCircleBgColor: Colors.transparent,
  ),
  const SingleIntroScreen(
    title: 'Seamless Checkout, Fast Delivery',
    description: 'Shop with confidence using secure payments and enjoy lightning-fast delivery.',
    imageAsset: 'images/undraw_shopping-bags_nfsf.png',
    mainCircleBgColor: Colors.transparent,
  ),
];
class Introscreen extends StatelessWidget {
  const Introscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedIntroduction(
      slides: pages,
      containerBg: Colors.white,
      footerBgColor: Color(0xFF8188E8),
      indicatorType: IndicatorType.circle,
      onDone: () {
        Get.off(()=>LoginPage());
      },
    );
  }
}
