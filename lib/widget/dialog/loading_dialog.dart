import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:myflutter/common/ext/asset_ext.dart';

/// 通用加载对话框
class LoadingDialog extends Dialog {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, //透明类型
      child: Center(
        child: Container(
          width: 180.w,
          height: 180.w,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: const Color(0xFFFFFFFF),
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.w),
              ),
            ),
          ),
          child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                const Color(0xFFF0888C),
                BlendMode.srcIn,
              ),
              child: Lottie.asset("view_loading".lottie,
                  width: 160.w, height: 160.w)),
        ),
      ),
    );
  }
}
