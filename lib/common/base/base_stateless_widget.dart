
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myflutter/common/base/view_state.dart';
import 'package:myflutter/common/util/log_util.dart';
import 'base_controller.dart';
import 'cpn_default_view_state.dart';

///常用页面无状态page封装，基本依赖Controller+OBX实现原有State+StatefulWidget效果
abstract class BaseStatelessWidget<T extends BaseController> extends GetView<T>{
  const BaseStatelessWidget({super.key, this.bindViewState = true});

  final bool bindViewState;


  @override
  Widget build(BuildContext context) {
    preInit();
    if (!autoLoadData()) {
      controller.loadData();
    }
    return Obx(() {
      ViewState viewState = controller.viewState.value;
      Widget child;
      if (bindViewState) {
        if (viewState.isSuccess()) {
          child = buildBody(context);
        } else if (viewState.isEmpty()) {
          child = buildCustomEmptyWidget() ??
              defaultEmptyWidget(() {
                controller.loadData();
              });
        } else if (viewState.isFail()) {
          child = buildCustomFailWidget() ??
              defaultFailWidget(viewState.errorCode, viewState.errorMessage,
                      () {
                        controller.loadData();
                  });
        } else if (viewState.isError()) {
          child = buildCustomErrorWidget() ??
              defaultErrorWidget(viewState.errorCode, viewState.errorMessage,
                      () {
                        controller.loadData();
                  });
        } else if (viewState.isLoading()) {
          child = buildCustomLoadingWidget() ?? defaultLoadingWidget();
        } else {
          LogD("defaultLoadingWidget");
          child = buildCustomLoadingWidget() ?? defaultLoadingWidget();
        }
      } else {
        child = buildBody(context);
      }

      return useScaffold()
          ? Scaffold(
          appBar: buildAppBar(),
          resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
          backgroundColor: backgroundColor(),
          body: child)
          : child;
    });
  }

  void preInit() {}

  Widget buildBody(BuildContext context);

  Widget? buildCustomLoadingWidget() {
    return null;
  }

  Widget? buildCustomFailWidget() {
    return null;
  }

  Widget? buildCustomEmptyWidget() {
    return null;
  }
  Widget? buildCustomErrorWidget() {
    return null;
  }

  AppBar? buildAppBar() {
    return null;
  }

  bool autoLoadData() => false;

  bool resizeToAvoidBottomInset() => true;

  bool useScaffold() => true;

  Color backgroundColor() => const Color(0xFFFAFAFA);
}