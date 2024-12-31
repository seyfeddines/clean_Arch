

import 'package:get/get.dart';

class HomePageController extends GetxController{
  int selected = 1;
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;
  void menueopen (){
    xOffset = 290;
    yOffset = 80;
    isDrawerOpen = true;
    print(isDrawerOpen);
    update();
  }
  void menwclose(){
    xOffset = 0;
    yOffset = 0;
    isDrawerOpen = false;
    update();
  }
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