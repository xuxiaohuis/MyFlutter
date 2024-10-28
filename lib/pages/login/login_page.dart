
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../common/base/base_stateless_widget.dart';
import 'login_controller.dart';

class LoginPage extends BaseStatelessWidget<LoginController>{
  const LoginPage({super.key});

/*  const LoginPage({super.key,this.mBindViewState = false}):super(bindViewState: mBindViewState);
  final bool mBindViewState;*/

  @override
  Widget buildBody(BuildContext context) {

    return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text(controller.account.value),
          Text(controller.password.value)
        ]
    ));
  }

}