
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/base/base_stateless_widget.dart';
import '../../router/AppRoutes.dart';
import 'main_tab_page2_controller.dart';

class MainTabPage2 extends BaseStatelessWidget<MainTabPage2Controller>{
  const MainTabPage2({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: Center(child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.loginPage);
        },
        child: Text(
          '去登录',
          style: TextStyle(fontSize: 20),
        ),
      ),),
      backgroundColor: Colors.transparent,
    );
  }
}