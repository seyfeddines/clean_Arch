import 'package:clean_arch/features/presentation/Widgets/ButtonChose.dart';
import 'package:clean_arch/features/presentation/Widgets/DrawerWidget.dart';

import 'package:clean_arch/features/presentation/Widgets/proudect_widget.dart';
import 'package:clean_arch/features/presentation/getx/home_page_controler.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home_page extends StatelessWidget {
  final HomePageController controller = Get.put(HomePageController());
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double xOffset = 0;
    double yOffset = 0;

    bool isDrawerOpen = true;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          children: [
            DrawerScreen(), GetBuilder<HomePageController>(builder: (controler){
              return AnimatedContainer(
              transform: Matrix4.translationValues(controller.xOffset, controller.yOffset, 0)
                ..scale(controller.isDrawerOpen ? 0.85 : 1.00)
                ..rotateZ(controller.isDrawerOpen ? -50 : 0),
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
              ),
              child: Column(

                children: [
                  PreferredSize(
                    preferredSize: Size(double.infinity, 55),
                    child: Column(
                      children: [
                        SizedBox(height: 35),
                        ListTile(
                          leading: controller.isDrawerOpen ? GetBuilder<HomePageController>(builder: (controler){
                            return GestureDetector(
                              child: Icon(Icons.arrow_back_ios),
                              onTap: () {
                                controler.menwclose();
                              },
                            );
                          })
                              : InkWell(
                            child: Icon(Icons.menu),
                            onTap: () {
                              print('help');
                              controller.menueopen();
                            },
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.person, size: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discover Products',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.shopping_cart_outlined, size: 30),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GetBuilder<HomePageController>(
                    init: HomePageController(),
                    builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildCategoryButton(controller, 'Sofas', 1),
                          buildCategoryButton(controller, 'Chairs', 2),
                          buildCategoryButton(controller, 'Tablet', 3),
                          buildCategoryButton(controller, 'Kitchen', 4),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Expanded(child: AnimatedProductGrid()),
                  GetBuilder<HomePageController>(
                    builder: (controller) {
                      return DotCurvedBottomNav(
                        scrollController: _scrollController,
                        hideOnScroll: true,
                        indicatorColor: Colors.blue,
                        backgroundColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        animationCurve: Curves.ease,
                        selectedIndex: controller.selectedbar,
                        indicatorSize: 8,
                        borderRadius: 25,
                        height: 70,
                        onTap: (index) {
                          controller.changeselectedvaluebar(index);
                        },
                        items: [
                          buildBottomNavItem(controller, Icons.favorite, 0),
                          buildBottomNavItem(controller, Icons.home, 1),
                          buildBottomNavItem(controller, Icons.settings, 2),
                        ],
                      );
                    },
                  )
                ],
              ),
            );})
          ],
      ),

    );
  }
}

