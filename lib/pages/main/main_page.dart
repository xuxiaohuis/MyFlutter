
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../router/AppRoutes.dart';

class MainPage extends StatelessWidget{
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: const Color(0xFF9FE69F),
    );
  }

}