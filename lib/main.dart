import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orkut/base/Screens/login/tela_login.dart';
import 'package:orkut/services/auth_services.dart';
import 'package:orkut/widgets/auth_check.dart';
import 'package:provider/provider.dart';
import 'base/Screens/login/tela_cadastro_e_login.dart';
import 'base/Screens/feed/feed.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
   MultiProvider(
    providers: [
      StreamProvider.value(value: FirebaseAuth.instance.authStateChanges(), initialData: null,),
      ChangeNotifierProvider(create: (_) => AuthService())
    ],
    child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
       const SystemUiOverlayStyle(statusBarColor: Color(0xFFFFC1D2)));
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //appBarTheme: AppBarTheme(color: Colors.white),
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => AuthCheck(),
        '/login': (_) => TelaLogin(),
        '/cadastro_e_login': (_) => TelaCadastroELogin(),
        '/feed': (_) => TelaFeed(),
      },
    );
  }
}

