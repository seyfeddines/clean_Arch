import 'package:clean_arch/features/presentation/getx/home_page_controler.dart';
import'package:flutter/material.dart';
ElevatedButton buildCategoryButton(HomePageController controller, String title, int index) {
  return ElevatedButton(
    onPressed: () => controller.changeselectedvalue(index),
    child: Text(title, style: TextStyle(color: Colors.white)),
    style: ElevatedButton.styleFrom(
      backgroundColor: controller.selected == index ? Color(0xFF0E0E0E) : Colors.grey,
      padding: EdgeInsets.symmetric(horizontal: 15),
    ),
  );
}

Icon buildBottomNavItem(HomePageController controller, IconData icon, int index) {
  return Icon(
    icon,
    color: controller.selectedbar == index ? Colors.blue : Colors.white,
  );
}
