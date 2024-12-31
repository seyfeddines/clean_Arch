

import 'package:get/get.dart';

class HomePageController extends GetxController{
  int selected = 1;
  void changeselectedvalue (int select){
    selected=select;
    update();
  }
  int selectedbar = 0;
  void changeselectedvaluebar (int select){
    selectedbar=select;
    update();
  }
}