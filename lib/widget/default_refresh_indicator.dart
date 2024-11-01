import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;
import 'package:flutter/material.dart' hide RefreshIndicator, RefreshIndicatorState;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:myflutter/common/ext/asset_ext.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

/// 自定义下拉刷新指示器
class DefaultRefreshHeader extends RefreshIndicator {
  DefaultRefreshHeader({super.key})
      : super(height: 180.w, refreshStyle: RefreshStyle.Follow);

  @override
  State<StatefulWidget> createState() {
    return _DefaultRefreshHeaderState();
  }
}

class _DefaultRefreshHeaderState
    extends RefreshIndicatorState<DefaultRefreshHeader> {
  @override
  Widget buildContent(BuildContext context, RefreshStatus refreshStatus) {
    Widget textWidget;
    Widget? imageWidget;
    if (refreshStatus == RefreshStatus.canRefresh) {
      textWidget = Text("释放刷新",
          style: TextStyle(
              color: const Color(0xFF9FE69F), fontSize: 28.w));
      imageWidget = ColorFiltered(
          colorFilter: ColorFilter.mode(
            const Color(0xFF9FE69F),
            BlendMode.srcIn,
          ),
          child: Lottie.asset("view_loading".lottie,
              width: 120.w, height: 120.w, animate: false));
    } else if (refreshStatus == RefreshStatus.refreshing) {
      textWidget = Text("刷新中...",
          style: TextStyle(
              color: const Color(0xFF666666), fontSize: 28.w));
      imageWidget = ColorFiltered(
          colorFilter: ColorFilter.mode(
            const Color(0xFF9FE69F),
            BlendMode.srcIn,
          ),
          child:
              Lottie.asset("view_loading".lottie, width: 120.w, height: 120.w));
    } else if (refreshStatus == RefreshStatus.completed) {
      textWidget = Text("刷新成功",
          style: TextStyle(
              color: const Color(0xFF666666), fontSize: 28.w));
    } else if (refreshStatus == RefreshStatus.failed) {
      textWidget = Text("刷新失败",
          style: TextStyle(
              color: const Color(0xFF666666), fontSize: 28.w));
    } else {
      textWidget = Text("下拉刷新",
          style: TextStyle(
              color: const Color(0xFF666666), fontSize: 28.w));
      imageWidget = ColorFiltered(
          colorFilter: ColorFilter.mode(
            const Color(0xFF9FE69F),
            BlendMode.srcIn,
          ),
          child: Lottie.asset("view_loading".lottie,
              width: 120.w, height: 120.w, animate: false));
    }
    return Obx(
      () => Container(
        color: const Color(0xFFFAFAFA),
        width: double.infinity,
        height: 180.w,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageWidget ?? SizedBox(width: 120.w, height: 120.w),
            textWidget,
            SizedBox(width: 120.w, height: 120.w)
          ],
        ),
      ),
    );
  }
}

/// 自定义上拉加载指示器
class DefaultRefreshFooter extends LoadIndicator {
  DefaultRefreshFooter({super.key})
      : super(height: 140.w, loadStyle: LoadStyle.ShowAlways);

  @override
  State<StatefulWidget> createState() {
    return _DefaultRefreshFooterState();
  }
}

class _DefaultRefreshFooterState
    extends LoadIndicatorState<DefaultRefreshFooter> {
  @override
  Widget buildContent(BuildContext context, LoadStatus loadStatus) {
    Widget textWidget;
    Widget? imageWidget;
    if (loadStatus == LoadStatus.loading) {
      textWidget = Text("加载更多中...",
          style: TextStyle(
              color: const Color(0xFF666666), fontSize: 28.w));
      imageWidget = ColorFiltered(
          colorFilter: ColorFilter.mode(
            const Color(0xFF9FE69F),
            BlendMode.srcIn,
          ),
          child:
              Lottie.asset("view_loading".lottie, width: 120.w, height: 120.w));
    } else if (loadStatus == LoadStatus.noMore) {
      textWidget = Text("-- 暂无更多数据 --",
          style: TextStyle(
              color: const Color(0xFF666666), fontSize: 28.w));
    } else if (loadStatus == LoadStatus.failed) {
      textWidget = Text("-- 加载失败 --",
          style: TextStyle(
              color: const Color(0xFF666666), fontSize: 28.w));
    } else if (loadStatus == LoadStatus.canLoading) {
      textWidget = Text("释放加载更多",
          style: TextStyle(
              color: const Color(0xFF666666), fontSize: 28.w));
      imageWidget = ColorFiltered(
          colorFilter: ColorFilter.mode(
              const Color(0xFF9FE69F),
            BlendMode.srcIn,
          ),
          child: Lottie.asset("view_loading".lottie,
              width: 120.w, height: 120.w, animate: false));
    } else {
      textWidget = Text("加载成功",
          style: TextStyle(
              color: const Color(0xFF666666), fontSize: 28.w));
    }
    return Obx(() => Container(
          color: const Color(0xFFFAFAFA),
          width: double.infinity,
          height: 140.w,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageWidget ?? SizedBox(width: 120.w, height: 120.w),
              textWidget,
              SizedBox(width: 120.w, height: 120.w)
            ],
          ),
        ));
  }

  @override
  Future endLoading() {
    return Future.delayed(const Duration(microseconds: 500));
  }
}
