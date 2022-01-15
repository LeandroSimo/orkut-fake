import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orkut/services/auth_services.dart';

class TelaFeed extends StatefulWidget {
  const TelaFeed({ Key? key }) : super(key: key);

  @override
  _TelaFeedState createState() => _TelaFeedState();
}

class _TelaFeedState extends State<TelaFeed> with TickerProviderStateMixin{

  Authentification _authentification = Authentification();
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, );
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC1D2),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/assets/images/logo.png', height: 80,),
              Divider(),
              LottieBuilder.network('https://assets3.lottiefiles.com/packages/lf20_3oeltnlf.json',),
              ElevatedButton(
                onPressed: () => _authentification.signOut(),
                child: Text('Sair', style: TextStyle(fontSize: 18),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFED2590)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13))),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.only(top: 10, bottom: 10))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}