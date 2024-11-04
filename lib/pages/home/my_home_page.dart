
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myflutter/common/ext/asset_ext.dart';
import 'home_page_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final logic = Get.find<HomePageController>();
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
            width: 22.w,
            height: 22.w),
        activeIcon: activeImage == null
            ? const Icon(null)
            : RepaintBoundary(
            child: Lottie.asset(activeImage,
                repeat: false, width: 22.w, height: 22.w)
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
        FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavigationBarItems,
          elevation: 8.0,
          type: BottomNavigationBarType.fixed,
          onTap: (int index){
            logic.navigate(index);
          },
          currentIndex: logic.index.value,
        ),
        floatingActionButton: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(//实现圆
              borderRadius: BorderRadius.circular(40.r),
              color: Colors.white,
            ),
            margin: EdgeInsets.only(top:10),//外部margin
            padding: EdgeInsets.all(8), //内部margin
            child: FloatingActionButton(
              shape: CircleBorder(),
              elevation: 0,
              onPressed: () {
                // AppRoutes.jumpPage(AppRoutes.publishPage, needLogin: true);
              },
              child: Icon(Icons.add),
            )
        )
    ));
  }
}