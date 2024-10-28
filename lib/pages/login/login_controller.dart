
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myflutter/common/base/base_controller.dart';
import 'package:myflutter/common/util/md5_util.dart';
import '../../http/api_service.dart';

class LoginController extends BaseController<ApiService> with WidgetsBindingObserver{

  RxString account = "".obs;
  RxString password = "".obs;


  @override
  void loadData() {
    sendRequest(service.getAccountGenerate(Md5Util.generateMD5("{}")),bindViewState: true,
      showLoadingDialog: false,successCallback:(data) {
          account.value = data?.account??"";
          password.value = data?.password??"";
        });
  }

  @override
  void onHidden() {

  }

}