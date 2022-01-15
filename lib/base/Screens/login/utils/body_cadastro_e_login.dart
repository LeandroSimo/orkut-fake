import 'package:flutter/material.dart';
import 'package:orkut/services/auth_services.dart';

class BodyCadastroELogin extends StatefulWidget {
  const BodyCadastroELogin({ Key? key }) : super(key: key);

  @override
  _BodyCadastroELoginState createState() => _BodyCadastroELoginState();
}

class _BodyCadastroELoginState extends State<BodyCadastroELogin> {

  Authentification _authentification = Authentification();
  TextEditingController _controllerUsuario = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  bool _obscureText = true;

body(BuildContext context){
   return SingleChildScrollView(
     child: Container(
       padding: EdgeInsets.all(10),
       margin: EdgeInsets.only(top: 80),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Text(
             'Olá',
             style: TextStyle(
               fontSize: 22,
               fontWeight: FontWeight.bold,
               color: Color(0xFFED2590),
             ),
            ),
           Text(
             'Seja bem vindo(a)!',
             style: TextStyle(
               fontSize: 15,
              //  fontWeight: FontWeight.bold,
               color: Color(0xFFED2590),
             ),
             ),
           Divider(
             height: 30,
             color: Colors.white,
           ),
           Form(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 _textFormFieldUser(),
                 Divider(color: Colors.white,),
                 _textFormFieldEmail(),
                 Divider(color: Colors.white),
                 _textFormFieldPassword(),
                 Divider(
                   height: 20,
                   color: Colors.white,
                 ),
                ElevatedButton(
                  onPressed: (){},
                  child: Text('Cadastrar'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFED2590)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13))),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.only(top: 15, bottom: 15))
                  ),
                ),
               ],
             )
            ),
            Divider(color: Colors.white, height: 20,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Expanded(
                child: Divider(
                  color: Colors.grey,
                )
              ),
               Text(' Ou entre com ', style: TextStyle(fontSize: 15, color: Colors.grey),),
               Expanded(
                child: Divider(
                  color: Colors.grey,
                )
              ),
             ]
           ),
            Divider(color: Colors.white,),
           ElevatedButton(
             onPressed: () => _authentification.signInWithGoogle(), 
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children:[
                 Image.asset(
                   'lib/assets/images/google.png',
                   height: 45,
                   width: 45,
                   ),
                 Text(
                 'Entrar com o Google',
                 style: TextStyle(color: Colors.grey.shade700),
                ),
               ], 
             ),
             style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFffffff)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                  side: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  )  
                ))
            ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Text(
                 'Já possui uma conta?',
                 style: TextStyle(color: Colors.grey.shade700)
                ),
               TextButton(
                 onPressed: () => Navigator.of(context).pushNamed('/login'), 
                 child: Text(
                   'Entre agora',
                   style: TextStyle(
                     color: Color(0xFFED2590)
                   ),
                  ),
                )
             ],
           )
         ],
       ),
     ),
   );
 }

 _textFormFieldUser(){
   return TextFormField(
     cursorColor: Color(0xFFED2590),
     controller: _controllerUsuario,
     decoration: InputDecoration(
       labelText: 'Usuário',
       labelStyle: TextStyle(
         fontSize: 20,
       ),
       floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder:OutlineInputBorder(
      borderSide: BorderSide(
      color: Colors.grey.shade400, width: 2.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    contentPadding: const EdgeInsets.only(
      left: 14.0, bottom: 8.0, top: 8.0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10.0),
    ),
     ),
   );
 }

 _textFormFieldEmail(){
   return TextFormField(
     cursorColor: Color(0xFFED2590),
     controller: _controllerEmail,
     keyboardType: TextInputType.emailAddress,
     decoration: InputDecoration(
       labelText: 'Email',
       labelStyle: TextStyle(
         fontSize: 20,
       ),
       floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder:OutlineInputBorder(
      borderSide: BorderSide(
      color: Colors.grey.shade400, width: 2.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    contentPadding: const EdgeInsets.only(
      left: 14.0, bottom: 8.0, top: 8.0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10.0),
    ),
     ),
   );
 }

 _textFormFieldPassword(){
   return TextFormField(
     cursorColor: Color(0xFFED2590),
     controller: _controllerSenha,
     keyboardType: TextInputType.text,
     obscureText: _obscureText,
     decoration: InputDecoration(
       suffixIcon: IconButton(
         color: _obscureText == true ? Colors.grey : Color(0xFFED2590),
         icon: _obscureText == true ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
         onPressed:() => _obscureText == true ? setState(() => _obscureText = false) : setState(() => _obscureText = true)
         ),
       labelText: 'Senha',
       labelStyle: TextStyle(
         fontSize: 20,
       ),
       floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder:OutlineInputBorder(
      borderSide: BorderSide(
      color: Colors.grey.shade400, width: 2.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    contentPadding: const EdgeInsets.only(
      left: 14.0, bottom: 8.0, top: 8.0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10.0),
    ),
     ),
   );
 }
  @override
  Widget build(BuildContext context) {
    return body(context); 
  }
}