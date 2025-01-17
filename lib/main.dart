import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myflutter/pages/home/home_page_controller.dart';
import 'package:myflutter/pages/home/my_home_binding.dart';
import 'package:myflutter/pages/home/my_home_page.dart';
import 'package:myflutter/pages/login/login_binding.dart';
import 'package:myflutter/pages/login/login_page.dart';
import 'package:myflutter/router/AppRoutes.dart';
import 'package:myflutter/widget/default_refresh_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'http/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(750, 1334),
        builder: (context, child) => _defaultRefreshConfiguration(
          GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const MyHomePage(),
            getPages: AppRoutes.routerPages,
            initialBinding: MyHomeBinding(),
          ),
        ));
  }

  RefreshConfiguration _defaultRefreshConfiguration(Widget child) {
    return RefreshConfiguration(
        headerBuilder: () => DefaultRefreshHeader(),
        footerBuilder: () => DefaultRefreshFooter(),
        headerTriggerDistance: 180.w,
        maxOverScrollExtent: 100.w,
        maxUnderScrollExtent: 0,
        enableScrollWhenRefreshCompleted: true,
        enableLoadingWhenFailed: true,
        hideFooterWhenNotFull: false,
        enableBallisticLoad: true,
        footerTriggerDistance: 140.w,
        child: child);
  }
}
