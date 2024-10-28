
import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';
import 'package:myflutter/common/util/log_util.dart';
import 'api_service.dart';

///初始化注入对象
class Injection extends GetxService {
  Future<void> init() async {
    LogD("init service");
    Get.lazyPut(() => ApiService(), fenix: true);
    Get.lazyPut(() => EventBus(), fenix: true);
  }
}