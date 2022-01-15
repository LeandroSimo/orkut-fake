import 'package:flutter/material.dart';
import 'package:orkut/base/Screens/login/utils/body_login.dart';
import 'package:orkut/base/utils/appBar.dart';

class TelaLogin extends StatelessWidget {
   TelaLogin({ Key? key }) : super(key: key);

   AppBarBase _appBarBase = AppBarBase();
   BodyLogin _bodyLogin = BodyLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBarBase.appBar(context),
      body: _bodyLogin,
    );
  }
}