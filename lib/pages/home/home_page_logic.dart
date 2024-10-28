
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myflutter/common/event/app_lifecycle_change_event.dart';
import 'package:myflutter/common/util/event_bus_manager.dart';
import 'package:myflutter/pages/discovery/discovery_page.dart';
import 'package:myflutter/pages/main/main_page.dart';
import 'package:myflutter/widget/keep_alive_erapper.dart';

import '../../common/event/index_navigation_index_changed_event.dart';

/// WidgetsBindingObserver 是用来监听生命周期改变的
class HomePageLogic extends GetxController with WidgetsBindingObserver{
  RxInt index = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  final List<Widget> navPages = [
    const KeepAliveWrapper(child: MainPage()),
    KeepAliveWrapper(child: DiscoveryPage()),
  ];

  void navigate(int index){
    this.index.value = index;
    pageController.jumpToPage(index);
    // updateStatusBarColor(Colors.transparent, index != 1);
    eventBus.fire(IndexNavigationIndexChangedEvent(index));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    eventBus.fire(AppLifecycleChangeEvent(state));
  }
}