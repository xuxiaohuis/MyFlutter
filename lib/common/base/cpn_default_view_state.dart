import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:myflutter/common/ext/asset_ext.dart';

import '../../http/app_except.dart';


/// 默认页面状态视图组件（加载中、加载失败、网络错误、空布局）
Widget defaultLoadingWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40.w),
        ColorFiltered(
            colorFilter: ColorFilter.mode(
              const Color(0xFFF0888C),
              BlendMode.srcIn,
            ),
            child: Lottie.asset("view_loading".lottie,
                width: 256.w, height: 256.w)),
        // Text("加载中...",
        //     style: TextStyle(
        //         color: ColorPalettes.instance.thirdText, fontSize: 26.w)),
        SizedBox(height: 40.w),
      ],
    ),
  );
}

Widget defaultEmptyWidget(VoidCallback retryBlock) {
  return Obx(() {
    return InkWell(
      onTap: () {
        retryBlock();
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.w),
            Container(
                width: 256.w,
                height: 256.w,
                alignment: Alignment.center,
                child: Image.asset("ic_view_empty".webp,
                    width: 120.w,
                    height: 120.w,
                    color: const Color(0xFFF0888C))),
            Text("暂无数据，点击刷新",
                style: TextStyle(
                    color: const Color(0xFF999999), fontSize: 26.w)),
            SizedBox(height: 40.w),
          ],
        ),
      ),
    );
  });
}

Widget defaultFailWidget(
    int? errorCode, String? errorMessage, VoidCallback retryBlock) {
  return Obx(
    () => InkWell(
      onTap: () {
        retryBlock();
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.w),
            Container(
                width: 256.w,
                height: 256.w,
                alignment: Alignment.center,
                child: Image.asset("ic_view_fail".webp,
                    width: 180.w,
                    height: 180.w,
                    fit: BoxFit.fill,
                    color: const Color(0xFFF0888C))),
            // Text("请求失败[${errorCode ?? RequestException.CODE_UNKOWN_ERROR}:${errorMessage ?? "未知错误"}]，点击重试",
            Text("${errorMessage ?? "未知错误"}，点击重试",
                style: TextStyle(
                    color: const Color(0xFF999999), fontSize: 26.w)),
            SizedBox(height: 40.w),
          ],
        ),
      ),
    ),
  );
}

Widget defaultErrorWidget(
    int? errorCode, String? errorMessage, VoidCallback retryBlock) {
  return Obx(() => InkWell(
        onTap: () {
          retryBlock();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40.w),
              Container(
                  width: 256.w,
                  height: 256.w,
                  alignment: Alignment.center,
                  child: Image.asset(
                      (errorCode == AppException.CODE_NEWWORK_ERROR)
                          ? "ic_view_network_error".webp
                          : "ic_view_fail".webp,
                      width: 180.w,
                      height: 180.w,
                      color: const Color(0xFFF0888C))),
              // Text("请求失败[${errorCode ?? RequestException.CODE_UNKOWN_ERROR}:${errorMessage ?? "未知错误"}]，点击重试",
              Text("${errorMessage ?? "未知错误"}，点击重试",
                  style: TextStyle(
                      color: const Color(0xFF999999), fontSize: 26.w)),
              SizedBox(height: 40.w),
            ],
          ),
        ),
      ));
}
/*
Widget defaultSliverLoadingWidget() {
  return ScrollConfiguration(
      behavior: NoOverScrollBehavior(),
      child: CustomScrollView(
          slivers: [SliverToBoxAdapter(child: defaultLoadingWidget())]));
}

Widget defaultSliverEmptyWidget(VoidCallback retryBlock) {
  return ScrollConfiguration(
      behavior: NoOverScrollBehavior(),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: defaultEmptyWidget(retryBlock))
      ]));
}

Widget defaultSliverFailWidget(
    int? errorCode, String? errorMessage, VoidCallback retryBlock) {
  return ScrollConfiguration(
      behavior: NoOverScrollBehavior(),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
            child: defaultFailWidget(errorCode, errorMessage, retryBlock))
      ]));
}

Widget defaultSliverErrorWidget(
    int? errorCode, String? errorMessage, VoidCallback retryBlock) {
  return ScrollConfiguration(
      behavior: NoOverScrollBehavior(),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
            child: defaultErrorWidget(errorCode, errorMessage, retryBlock))
      ]));
}*/
