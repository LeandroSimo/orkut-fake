import 'package:flutter/material.dart';
import 'package:orkut/base/Screens/login/utils/body_cadastro_e_login.dart';
import 'package:orkut/base/utils/appBar.dart';

class TelaCadastroELogin extends StatelessWidget {
  TelaCadastroELogin({ Key? key }) : super(key: key);

  final AppBarBase _appBarBase = AppBarBase();
  final BodyCadastroELogin _bodyCadastroELogin  = BodyCadastroELogin();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      appBar: _appBarBase.appBar(context),
      body: _bodyCadastroELogin
    );
  }

  
}