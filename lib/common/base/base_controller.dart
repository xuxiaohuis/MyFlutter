
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myflutter/common/base/view_state.dart';
import 'package:myflutter/common/ext/get_ext.dart';
import 'package:myflutter/http/models/base_result.dart';
import '../../http/app_except.dart';
import '../util/log_util.dart';
import '../util/toast_util.dart';

typedef JudgeEmpty<T> = bool Function(T? value);
typedef JudgeNoMoreData<T> = bool Function(T? value);
typedef Convert<T, R> = R Function(T? value);

abstract class BaseController<M> extends SuperController{

  late M service;
  late EventBus eventBus;
  List<StreamSubscription>? _stremSubList;
  RxString barTitleString = "标题".obs;

  final Rx<ViewState> viewState = ViewState().obs;

  @override
  void onInit() {
    super.onInit();
    LogD('>>>>>>>onInit');
    if (useEventBus()) {
      eventBus = Get.find<EventBus>();
    }
    try {
      service = Get.find<M>();
    } catch (e) {
      LogE(e.toString());
    }
  }

  void loadData();

  /// 发起网络请求，同时处理异常，loading
  sendRequest<T>(Future<BaseResult<T>> sendRequestBlock,{
    bool bindViewState = true,
    bool showLoadingDialog = false,
    bool needLogin = false,
    bool emptyAsSuccess = false,
    JudgeEmpty<BaseResult<T>>? judgeEmptyCallback,
    ValueChanged<T?>? successCallback,
    VoidCallback? emptyCallback,
    VoidCallback? failCallback,
  }) {

    if (bindViewState) {
      LogD("showLoadingDialog");
      viewState.value = ViewStateLoading();
    }

    if (showLoadingDialog) {
      Get.showLoading();
    }

    sendRequestBlock.then((result) {
      if (result.isSuccess()) {
        bool isEmpty = (judgeEmptyCallback != null)
            ? judgeEmptyCallback(result)
            : result.isEmpty();
        if (showLoadingDialog) {
          Get.hideLoading();
        }
        if (!isEmpty || (emptyAsSuccess && isEmpty)) {
          if (bindViewState) {
            viewState.value = ViewStateSuccess(result.data);
          }
          if (successCallback != null) {
            successCallback(result.data);
          }
        } else {
          if (bindViewState) {
            viewState.value = ViewStateEmpty();
          }
          if (showLoadingDialog) {
            Get.hideLoading();
            showToast("${result.msg}(${result.code})");
          }
          if (emptyCallback != null) {
            emptyCallback();
          }
        }
      } else {
        if (bindViewState) {
          viewState.value = ViewStateFail(result.code, result.msg);
        }
        if (showLoadingDialog) {
          Get.hideLoading();
          showToast("${result.msg}(${result.code})");
        }
        if (failCallback != null) {
          failCallback();
        }
      }
    }).catchError((e, staceTrace) {
      AppException requestException = AppException.create(e);
      if (bindViewState) {
        viewState.value =
            ViewStateError(requestException.code, requestException.message);
      }
      if (showLoadingDialog) {
        Get.hideLoading();
        showToast("${requestException.message}(${requestException.code})");
      }
      if (failCallback != null) {
        failCallback();
      }
      LogE("sendRequest catchError====>error:$e, staceTrace:$staceTrace}");
    });
  }

  @override
  void onDetached() {
    LogD('>>>>>>>onDetached');
  }

  @override
  void onInactive() {
    LogD('>>>>>>>onInactive');
  }

  @override
  void onPaused() {
    LogD('>>>>>>>onPaused');
  }

  @override
  void onResumed() {
    LogD('>>>>>>>onResumed');
  }

  @override
  void onReady() {
    super.onReady();
    LogD('>>>>>>>onReady');
  }

  @override
  void onClose() {
    super.onClose();
    //解订阅EventBus
    disposeEventBus();
    LogD('>>>>>>>onClose');
  }

  ///解订阅StreamSubscription--关联EventBus
  void disposeEventBus() {
    _stremSubList?.forEach((element) {
      element.cancel();
    });
  }

  void showSuccess() {
    change(null, status: RxStatus.success());
  }

  void showEmpty() {
    change(null, status: RxStatus.empty());
  }

  void showError({String? errorMessage, Exception? e}) {
    if (e != null) {
      if (e is DioError && e.error is AppException) {
        var error = e.error as AppException;
        change(null, status: RxStatus.error(error.message));
      } else {
        change(null, status: RxStatus.error(errorMessage));
      }
    } else {
      change(null, status: RxStatus.error(errorMessage));
    }
  }

  void showLoading() {
    change(null, status: RxStatus.loading());
  }

  ///是否使用GetX查找EventBus
  bool useEventBus() => false;

  ///管理Eventbus解订阅
  void addStremSub(StreamSubscription? streamSubscription) {
    _stremSubList ??= [];
    if (streamSubscription != null) {
      _stremSubList?.add(streamSubscription);
    }
  }

}