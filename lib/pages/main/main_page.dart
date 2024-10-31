
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myflutter/common/ext/asset_ext.dart';
import 'package:myflutter/pages/main/main_page_controller.dart';
import '../../router/AppRoutes.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainPageController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('生存日记', style: TextStyle(color: Color(0xFF02020D))),
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 100.w),
            child: _topBar(controller)),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: controller.navPages,
      ),
      backgroundColor: Color(0x24FAD956),
    );
  }
}

Widget _topBar(MainPageController controller){
  return Row(
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(child: _tabBar(controller)),
      InkWell(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.w,horizontal: 40.w),
          child: Hero(tag: 'ic_login', child: Image.asset('ic_search'.webp,width: 40.w,height: 40.w,)),
        ),
        onTap: (){
          Get.toNamed(AppRoutes.loginPage);
        },
      )
    ],
  );
}

Widget _tabBar(MainPageController controller) {
  return TabBar(
    tabs: controller.tabs.map((tab) {
      return Container(
        height: 72.w,
        alignment: Alignment.center,
        child: Text(
          tab,
          textAlign: TextAlign.center,
        ),
      );
    }).toList(),
    controller: controller.tabController,
    onTap: (int index){
      controller.jumpToPage(index);
    },
  );
}