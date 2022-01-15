import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orkut/base/Screens/feed/feed.dart';
import 'package:orkut/base/Screens/login/tela_cadastro_e_login.dart';
import 'package:orkut/services/auth_services.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService authService = Provider.of<AuthService>(context);
    if (authService.isLoading)
      return loading();
    else if (authService.usuario == null)
      return TelaCadastroELogin();
    else
      return TelaFeed();
  }

  loading() {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
