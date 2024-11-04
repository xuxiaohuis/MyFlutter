
import 'dart:async';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../common/base/base_controller.dart';
import '../../http/api_service.dart';

class MainTabPage1Controller extends BaseController<ApiService> {

  RefreshController refreshController = RefreshController(initialRefresh: false);
  var timer ;

  @override
  void loadData() {
    // TODO: implement loadData
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }


  @override
  void dispose() {
    ///释放内存防止内存泄漏
    timer.cancel();
    super.dispose();
  }

}