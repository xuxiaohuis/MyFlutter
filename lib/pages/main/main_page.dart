
 import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';
import 'package:myflutter/common/ext/asset_ext.dart';
import 'package:myflutter/pages/main/main_page_controller.dart';
import 'package:myflutter/res/colors.dart';
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
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 260.h),
            child: Column(
              children: [
                _title(),
                _banner(controller),
                Container(
                  margin: EdgeInsets.only(left: 16.w,top: 16.h,right: 16.w,bottom: 16.h),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      _centerIcons("ic_search", "推广计划"),
                      _centerIcons("ic_search", "推广计划"),
                      _centerIcons("ic_search", "推广计划"),
                      _centerIcons("ic_search", "推广计划"),
                      _centerIcons("ic_search", "推广计划")
                    ],
                  ),
                ),
                _topBar(controller)
              ],
            )),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: controller.navPages,
      ),
      backgroundColor: Color(0x24FAD956),
    );
  }
}

Widget _centerIcons(String image,String title){
  return Expanded(
    flex: 1,
    child: SizedBox(
      height: 60.w,
      child: Column(
        children: [
          Image.asset(
            image.webp,
            width: 40.w,
            height: 40.h,
          ),
          Text(title,style: TextStyle(fontSize: 12.sp),)
        ],
      ),
    ),
  );
}

Widget _banner(MainPageController controller){
  return Container(
    height: 140.h,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 16.h),
    child: Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          child: CachedNetworkImage(
            imageUrl: controller.getImages()[index],
            fit: BoxFit.fill,
          ),
        );
      },
      itemCount: controller.getImages().length,
      indicatorLayout: PageIndicatorLayout.COLOR,
      pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              activeColor: ColorsUtil.color_FFFFFFFF,
              color: ColorsUtil.color_80FFFFFF,
              activeSize: 10.w,
              size: 8.w)),
      autoplay: true,
      layout: SwiperLayout.DEFAULT,
    ),
  );
}

Widget _title(){
  return Row(
    children: [Text("榕乐推"), _icons("ic_main_account", "推广账号")],
  );
}

Widget _icons(String icon,String text){
  return SizedBox(
    width: 98.w,
    height: 41.h,
    child: Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: 85.w,
          height: 28.h,
          padding:
              EdgeInsets.only(left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
          decoration: BoxDecoration(
              color: ColorsUtil.color_B3FFFFFF,
              borderRadius: BorderRadius.all(Radius.circular(100.r))),
          child: Center(
            child: Text(
              text,
              style:
                  TextStyle(color: ColorsUtil.color_FF3300FF, fontSize: 12.sp),
            ),
          ),
        ),
        Positioned(
          top: -12.w,
          left: 0.w,
          child: Image.asset(icon.webp, width: 50.w, height: 50.h),
        )
      ],
    ),
  );
}

Widget _topBar(MainPageController controller){
  return Padding(padding: EdgeInsets.only(right: 16.w),child: Row(
    mainAxisSize: MainAxisSize.max,
    children: [
      SizedBox(
        width: 220.w,
        child: _tabBar(controller),
      ),
      Expanded(flex: 1,child: SizedBox(),),
      InkWell(
        child: Hero(
            tag: 'ic_search',
            child: Image.asset(
              'ic_search'.webp,
              width: 22.w,
              height: 22.h,
            )),
        onTap: () {
          Get.toNamed(AppRoutes.loginPage);
        },
      )
    ],
  ),);
}

Widget _tabBar(MainPageController controller) {
  return TabBar(
    dividerColor: Colors.transparent,
    labelColor: ColorsUtil.color_CC000000,
    unselectedLabelColor: ColorsUtil.color_99000000,
    labelStyle: TextStyle(fontSize: 16.sp),
    unselectedLabelStyle: TextStyle(fontSize: 14.sp),
    indicatorColor: ColorsUtil.color_FFF04BF3,
    indicatorWeight: 2,
    indicatorSize: TabBarIndicatorSize.label,
    tabs: controller.tabs.map((tab) {
      return Container(
        height: 23.h,
        width: 64.w,
        alignment: Alignment.center,
        child: Text(
          tab,
          textAlign: TextAlign.center,
          // style: TextStyle(fontSize: 14.sp),
        ),
      );
    }).toList(),
    controller: controller.tabController,
    onTap: (int index) {
      controller.jumpToPage(index);
    },
  );
}