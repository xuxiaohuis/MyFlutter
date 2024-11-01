
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
            preferredSize: Size(double.infinity, 300.w),
            child: Column(
              children: [
                _title(),
                _banner(controller),
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
Widget _banner(MainPageController controller){
  return Container(
    height: 200.w,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    child: Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
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
    children: [
      Text("榕乐推"),
      _icons("ic_main_account", "推广账号")
    ],
  );
}

Widget _icons(String icon,String text){
  return SizedBox(
    width: 98.w,
    height: 41.w,
    child: Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: 85.w,
          height: 28.w,
          padding: EdgeInsets.only(left: 10.0,top:0.0,right: 0.0,bottom: 0.0),
          decoration: BoxDecoration(
              color : ColorsUtil.color_B3FFFFFF,
              borderRadius: BorderRadius.all(Radius.circular(100))
          ),
          child: Center(
            child: Text(text,style: TextStyle(color: ColorsUtil.color_FF3300FF,fontSize: 12.sp),),
          ),
        ),
        Positioned(
          top: -12.w,
          left: 0.w,
          child: Image.asset(icon.webp,
              width: 50.w,
              height: 50.w),
        )
      ],
    ),
  );
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