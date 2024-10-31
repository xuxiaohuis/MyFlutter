
import 'package:get/get.dart';
import 'package:myflutter/pages/home/home_page_controller.dart';
import 'package:myflutter/pages/main/main_tab_page1.dart';
import 'package:myflutter/pages/main/main_tab_page1_controller.dart';
import 'package:myflutter/pages/main/main_tab_page2_controller.dart';

import '../main/main_page_controller.dart';

class MyHomeBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(()=>HomePageController());
    Get.lazyPut(()=>MainPageController());
    // Get.lazyPut(()=>MainTabPage1Controller());
    Get.lazyPut(()=>MainTabPage2Controller());
  }

}