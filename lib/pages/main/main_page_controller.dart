
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:myflutter/pages/main/main_tab_page1.dart';
import '../../common/base/base_controller.dart';
import '../../http/api_service.dart';
import '../../widget/keep_alive_erapper.dart';
import 'main_tab_page2.dart';

class MainPageController extends BaseController<ApiService> with GetSingleTickerProviderStateMixin{

  RxInt index = 0.obs;
  final List<String> tabs = ['短剧影视', '小说故事'];
  late TabController tabController;
  late List<String> bannerImages = <String>[].obs;

  final List<Widget> navPages = [
    KeepAliveWrapper(child: MainTabPage1()),
    KeepAliveWrapper(child: MainTabPage2()),
  ];

  List<String> getImages(){
    bannerImages.clear();
    bannerImages.add("https://www.itying.com/images/flutter/1.png");
    bannerImages.add("https://www.itying.com/images/flutter/2.png");
    bannerImages.add("https://www.itying.com/images/flutter/3.png");
    bannerImages.add("https://www.itying.com/images/flutter/4.png");
    bannerImages.add("https://www.itying.com/images/flutter/5.png");
    bannerImages.add("https://www.itying.com/images/flutter/6.png");
    return bannerImages;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
        initialIndex: index.value, vsync: this, length: tabs.length);
    tabController.addListener(() {
      if (!tabController.indexIsChanging &&
          index.value != tabController.index) {
        index.value = tabController.index;
      }
    });
  }


  void jumpToPage(int index) {
    // this.index.value = index;
    tabController.animateTo(index);
  }

  @override
  void loadData() {

  }

  @override
  void onHidden() {

  }

}