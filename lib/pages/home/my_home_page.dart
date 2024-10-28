
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myflutter/common/ext/asset_ext.dart';
import 'home_page_logic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final logic = Get.find<HomePageLogic>();
  final List<BottomNavigationBarItem> bottomNavigationBarItems = [
    _customBottomNavigationBarItem("nav_home".png, "nav_home".lottie, "主页"),
    _customBottomNavigationBarItem(
        "nav_discovery".png, "nav_discovery".lottie, "发现"),
  ];

  static BottomNavigationBarItem _customBottomNavigationBarItem(
      String? defaultImage, String? activeImage, String label) {
    return BottomNavigationBarItem(
        icon: defaultImage == null
            ? const Icon(null)
            : Image.asset(defaultImage,
            width: 44.w,
            height: 44.w),
        activeIcon: activeImage == null
            ? const Icon(null)
            : RepaintBoundary(
            child: Lottie.asset(activeImage,
                repeat: false, width: 44.w, height: 44.w)
        ),
        label: label
    );
  }

  @override
  Widget build(BuildContext context) {

    return Obx(()=>Scaffold(
        body: PageView(
          controller: logic.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: logic.navPages,
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavigationBarItems,
          elevation: 8.0,
          type: BottomNavigationBarType.fixed,
          onTap: (int index){
            logic.navigate(index);
          },
          currentIndex: logic.index.value,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF3F5BE1),
          elevation: 8.0,
          child: Image.asset("assets/image/nav_home.png",
              width: 72.w, height: 72.w, color: Colors.white),
          onPressed: () {
            // AppRoutes.jumpPage(AppRoutes.publishPage, needLogin: true);
          },
        )
    ));
  }
}