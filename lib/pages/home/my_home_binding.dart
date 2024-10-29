
import 'package:get/get.dart';
import 'package:myflutter/pages/home/home_page_controller.dart';

class MyHomeBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(()=>HomePageController());
  }

}