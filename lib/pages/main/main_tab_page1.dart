
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myflutter/common/util/log_util.dart';
import 'package:myflutter/pages/main/main_tab_page1_controller.dart';
import 'package:myflutter/pages/main/widget/main_tab_page1_item.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../common/util/toast_util.dart';
import '../../http/models/main_tab_item_entity.dart';

class MainTabPage1 extends StatefulWidget  {
  const MainTabPage1({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RefreshPageState();
  }
}

class _RefreshPageState extends State<MainTabPage1>{

  RxList<MainTabItemEntity> myList = <MainTabItemEntity>[].obs;

  @override
  Widget build(BuildContext context) {
    addList();
    final controller = Get.find<MainTabPage1Controller>();
    return SmartRefresher(
      controller: controller.refreshController,
      header: MaterialClassicHeader(),
      footer: ClassicFooter(),
      enablePullUp: true,
      enablePullDown: true,
      onRefresh:_onRefresh,
      onLoading: ()=>{
        ///上拉加载回调

      },
      child: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return InkWell(
            child: MainTabPage1Item(item: myList[index]),
            onTap: () {
              showToast("${myList[index].name}----");
            },
          );
        },
        itemCount: myList.length,
      ),
    );
  }

  Future<void> _onRefresh(){
    return Future.delayed(Duration(seconds: 2),(){
      LogD("刷新回调");
      // 延迟2s完成刷新
      // setState(() {
      //   _refreshController.refreshCompleted();
      // });
    });
  }

  void addList(){
    myList.clear();
    var item1 = MainTabItemEntity();
    item1.url = "https://bkimg.cdn.bcebos.com/pic/d1a20cf431adcbef7609f0eb33e539dda3cc7dd93181?x-bce-process=image/format,f_auto/watermark,image_d2F0ZXIvYmFpa2UyNzI,g_7,xp_5,yp_5,P_20/resize,m_lfit,limit_1,h_1080";
    item1.name = "这是第一个名称";
    item1.desc = "这是第一个描述";
    var item2 = MainTabItemEntity();
    item2.url = "https://bkimg.cdn.bcebos.com/pic/5fdf8db1cb1349540923358ac9048558d109b2dedc80?x-bce-process=image/format,f_auto/watermark,image_d2F0ZXIvYmFpa2UyNzI,g_7,xp_5,yp_5,P_20/resize,m_lfit,limit_1,h_1080";
    item2.name = "这是第二个名称";
    item2.desc = "这是二个描述";
    myList.add(item1);
    myList.add(item2);
    myList.add(item1);
    myList.add(item2);
    myList.add(item1);
    myList.add(item2);

    myList.add(item1);
    myList.add(item2);
    myList.add(item1);
    myList.add(item2);
    myList.add(item1);
    myList.add(item2);

    myList.add(item1);
    myList.add(item2);
    myList.add(item1);
    myList.add(item2);
    myList.add(item1);
    myList.add(item2);
  }

}