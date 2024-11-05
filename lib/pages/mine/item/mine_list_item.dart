
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myflutter/common/ext/asset_ext.dart';
import '../../../res/colors.dart';
import 'mine_item_data.dart';

class MineListItem extends StatelessWidget{

  final MineItemData item;
  const MineListItem({required this.item ,super.key});

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 38.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            item.icon ?? '',
            width: 22.w,
            height: 22.h,
          ),
          SizedBox(
            width: 4.w,
          ),
          Expanded(
              flex: 1,
              child: Text(
                item.title ?? "",
                style: TextStyle(
                    fontSize: 14.sp, color: ColorsUtil.color_CC000000),
              )),
          Image.asset(
            'ic_arrow_right_white'.webp,
            height: 14.h,
            width: 14.w,
          )
        ],
      ),
    );
  }

}