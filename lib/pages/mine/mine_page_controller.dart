import 'package:myflutter/common/ext/asset_ext.dart';
import 'package:myflutter/pages/mine/item/mine_item_data.dart';
import '../../common/base/base_controller.dart';
import '../../http/api_service.dart';

class MinePageController extends BaseController<ApiService>{

  final List<MineItemData> mList = <MineItemData>[
    MineItemData("ic_mine_list_account".webp,"账户与安全"),
    MineItemData("ic_mine_list_history".webp,"浏览记录"),
    MineItemData("ic_mine_list_collect".webp,"我的收藏"),
    MineItemData("ic_mine_list_notice".webp,"通知设置"),
    MineItemData("ic_mine_list_about".webp,"关于我们")
  ];

  @override
  void loadData() {
    // TODO: implement loadData

  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

}