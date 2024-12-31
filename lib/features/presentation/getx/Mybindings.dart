import 'package:clean_arch/features/presentation/getx/home_page_controler.dart';
import 'package:get/get.dart';
class Mybindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>HomePageController());
  }

}