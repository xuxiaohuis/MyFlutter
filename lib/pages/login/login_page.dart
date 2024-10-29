import 'package:flutter/material.dart';
import '../../common/base/base_stateless_widget.dart';
import '../../res/colors.dart';
import 'login_controller.dart';

class LoginPage extends BaseStatelessWidget<LoginController> {
  const LoginPage({super.key});

  // const LoginPage({super.key,mBindViewState = true}):super(bindViewState: mBindViewState);

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
          child: Container(
        decoration: BoxDecoration(
            color: ColorsUtil.color_FFFF413D,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 12,
            ),
            Text("账号注册",
                style:
                    TextStyle(color: ColorsUtil.color_FFFFFFFF, fontSize: 16)),
            SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorsUtil.color_FFFFFFFF,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28.0),
                      topRight: Radius.circular(28.0),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero)),
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 34),child: _loginWidget(),)
              ,
            )
          ],
        ),
      )),
    );
  }

  Widget _loginWidget(){
    controller.accountEditController.text = controller.account.value;
    controller.passwordEditController.text = controller.password.value;
    return Column(
      children: [
        SizedBox(
          height: 28,
        ),
        TextFormField(
          controller: controller.accountEditController,
          decoration:
              InputDecoration(icon: Icon(Icons.favorite), labelText: '账号',hintText: '请输入账号'),
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: controller.passwordEditController,
          decoration:
              InputDecoration(icon: Icon(Icons.favorite), labelText: '密码',hintText: '请输入密码'),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Checkbox(value: false, onChanged: (bool? value) {}),
            Expanded(
              child: RichText(
                text: TextSpan(text: '我已阅读并接受',style: TextStyle(color: ColorsUtil.color_FFFF413D),children: [
                  TextSpan(text: '《用户服务协议》',style: TextStyle(color: ColorsUtil.color_FF0067FF)),
                  TextSpan(text: '和',style: TextStyle(color: ColorsUtil.color_FFFF413D)),
                  TextSpan(text: '《用户隐私协议》',style: TextStyle(color: ColorsUtil.color_FF0067FF))
                ]),
              ),
            )
          ],
        ),
        SizedBox(height: 24,),
        DecoratedBox(decoration: BoxDecoration(
            color: ColorsUtil.color_FFFF413D,
            borderRadius: BorderRadius.circular(20)),
          child:Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 90),child:
          Text('一键注册',style: TextStyle(color: ColorsUtil.color_FFFFFFFF),)
            ,)
        ),
      ],
    );
  }
}
