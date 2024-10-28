
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:myflutter/pages/home/my_home_binding.dart';
import 'package:myflutter/pages/home/my_home_page.dart';
import 'package:myflutter/pages/login/login_binding.dart';
import 'package:myflutter/pages/login/login_page.dart';

class AppRoutes{

  static const homePage = "/";
  static const loginPage = "/login";
  static final routerPages = [
    ///主入口
    GetPage(name: homePage, page: () => MyHomePage(), binding: MyHomeBinding()),
    /// 登录页面
    GetPage(name: loginPage, page: () => LoginPage(), binding: LoginBinding())
  ];

}