
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myflutter/common/ext/asset_ext.dart';
import 'package:myflutter/res/colors.dart';
import '../../common/base/base_stateless_widget.dart';
import '../../common/util/toast_util.dart';
import 'item/mine_list_item.dart';
import 'mine_page_controller.dart';

class MinePage extends BaseStatelessWidget<MinePageController>{
  const MinePage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    // controller.getListData();
    return Container(
      padding: EdgeInsets.only(top: 46.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 75.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                _avatar(),
                SizedBox(
                  width: 12.w,
                ),
                _userInfo(),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          ///余额部分UI
          Stack(
            children: [
              _balance(),
              ///右上角标签
              _cashOut()
            ],
          ),
          SizedBox(
            height: 9.h,
          ),
          /// 中间四个
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              _fourInMiddle('我的任务'),
              _fourInMiddle('邀请好友'),
              _fourInMiddle('金币活动'),
              _fourInMiddle('商务合作')
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: MineListItem(item: controller.mList[index]),
                onTap: () {
                  showToast("${controller.mList[index].title}----");
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 6.h,
              );
            },
            itemCount: controller.mList.length,
          ),
        ],
      ),
    );
  }

  Widget _fourInMiddle(String title){
    return Expanded(
      flex: 1,
      child: Container(
        height: 56.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: ColorsUtil.color_ADFFFFFF),
        child: Text(title,style: TextStyle(fontSize: 12.sp),),
      ),
    );
  }

  ///余额及收益信息UI
  Widget _balance(){
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12.r)),color: ColorsUtil.color_26164F84),
      height: 194.h,
      margin: EdgeInsets.only(right: 2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 16.w),
            child: Text(
              "我的余额（元）",
              style: TextStyle(
                  fontSize: 14.sp, color: ColorsUtil.color_CC000000),
            ),
          ),
          SizedBox(height: 4.h,),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              "0",
              style: TextStyle(
                  fontSize: 26.sp,
                  color: ColorsUtil.color_CC000000,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 12.h,),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12.r)),color: ColorsUtil.color_ADFFFFFF),
            height: 55.h,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
                children: [
                  _income('总收益（元）：','0'),
                  _income('今日收益（元）：','0'),
                  _income('昨日收益（元）：','0'),
                ],
            ),
          ),
          SizedBox(height: 12.h,),
          Row(
            children: [
              _recode('ic_line'.webp,'提现记录'),
              Container(height: 24.h,width: 1.w,color: Colors.white,),
              _recode('ic_line'.webp, '收益记录')
            ],
          )
        ],
      ),
    );
  }

  ///记录
  Widget _recode(String icon,String title){
    return Expanded(flex:1,child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon,height: 18.h,width: 20.w,),
        SizedBox(width: 7.w,),
        Text(title,style: TextStyle(color: Colors.white,fontSize: 14.sp),)
      ],
    ));
  }

  ///收益
  Widget _income(String title,String price){
    return Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.only(top: 10.h, left: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: ColorsUtil.color_66000000,
                  fontSize: 10.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                price,
                style: TextStyle(
                    color: ColorsUtil.color_FF000000, fontSize: 14.sp),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ));
  }

  ///立即提现
  Widget _cashOut(){
    return Positioned(
        right: -2.w,
        child: Padding(
          padding: EdgeInsets.only(top: 14.h),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('ic_cash_out'.webp)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "立即提现",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
                SizedBox(width: 5.w,),
                Image.asset('ic_triangle_right_white'.png,width: 5.w,height: 6.h,)
              ],
            ),
          ),
        ));
  }

  ///右侧用户信息UI
  Widget _userInfo(){
    return Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                    child: Text(
                      "用户8891",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    )),
                Flexible(
                    child: Text(
                      "佣金加成生效中",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: ColorsUtil.color_FFF04BF3, fontSize: 10.sp),
                    ))
              ],
            ),
            Text(
              "我的邀请码",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
              textAlign: TextAlign.left,
            ),
            _toBindInviteCode()
          ],
        )
    );
  }

  Widget _avatar(){
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: "https://www.itying.com/images/flutter/1.png",
        fit: BoxFit.fill,
        placeholder: (context, url) => Image.asset('ic_avatar'.png),
        width: 70.w,
        height: 70.h,
      ),
    );
  }

  ///绑定邀请码
  Widget _toBindInviteCode(){
    return Container(
        decoration: BoxDecoration(
            color: ColorsUtil.color_4DFFFFFF,
            borderRadius: BorderRadius.circular(300.r)),
        padding: EdgeInsets.symmetric(
            vertical: 4.h, horizontal: 8.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'ic_line'.webp,
              width: 14.w,
              height: 14.h,
            ),
            Flexible(child: Text(
              '绑定邀请码',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 11.sp, color: Colors.white),
            ),),
            Image.asset(
              'ic_arrow_right_white'.webp,
              width: 10.w,
              height: 10.h,
            ),
          ],
        )
    );
  }


}