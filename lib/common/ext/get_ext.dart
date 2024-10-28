import 'package:get/get.dart';

import '../../widget/dialog/loading_dialog.dart';
import '../util/log_util.dart';

extension GetExt on GetInterface {

  ///显示dialog
  showLoading() {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
    Get.dialog(const LoadingDialog(),
        transitionDuration: const Duration(milliseconds: 50),
        barrierDismissible: false);
  }

  ///隐藏dialog
  hideLoading() {
    LogD("hideLoading");
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
  }

  ///隐藏dialog
  hideBottomSheet() {
    if (Get.isBottomSheetOpen != null && Get.isBottomSheetOpen!) {
      Get.back();
    }
  }

}