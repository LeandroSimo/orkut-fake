import 'package:flutter/material.dart';
import 'package:orkut/services/auth_services.dart';
// import 'package:orkut/services/authentification.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({ Key? key }) : super(key: key);

  @override
  _BodyLoginState createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {

  Authentification _authentification = Authentification();

  final _formKey = GlobalKey<FormState>();
  String _email = 'teste@teste.com';
  String _senha = 'orkut123';
  bool _obscureText = true;
  TextEditingController _controllerUsuario = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

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
             'Bem vindo(a) de volta!',
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
             key: _formKey,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 _textFormFieldEmail(),
                 Divider(color: Colors.white),
                 _textFormFieldPassword(),
                 TextButton(
                   style: ButtonStyle(alignment: Alignment.centerRight),
                  onPressed: (){}, 
                  child: Text(
                    'Esqueci minha senha',
                    style: TextStyle(
                      color: Color(0xFFED2590)
                    ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: _login,
                  //() => Navigator.of(context).pushNamed('/feed') ,
                  child: Text('Entrar'),
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
                 'Não tem uma conta?',
                 style: TextStyle(color: Colors.grey.shade700)
                ),
               TextButton(
                 onPressed: () => Navigator.of(context).pushNamed('/cadastro_e_login'), 
                 child: Text(
                   'Crie agora',
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
 _textFormFieldEmail(){
   return TextFormField(
     validator: (value) => validatorEmail(_controllerEmail.text),
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
     validator: (value) => validatorSenha(_controllerSenha.text),
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

validatorEmail(String value){
   String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Informe o Email";
    }else if(value != _email){
      return "E-mail ou senha inválida";
    }
     else if(!regExp.hasMatch(value)){
      return "Email inválido";
    }
    return null;
 }
validatorSenha(String value){
   if (value.isEmpty){
      return "Informe o Email";
    }else if(value != _senha){
      return "E-mail ou senha inválida";
    }
    return null;
 }


 _login(){
    if (_formKey.currentState!.validate()) { 
        Navigator.of(context).pushNamed('/feed');   
      }  
    _limpaCampos();
  }

  _limpaCampos(){
    _controllerEmail.text = '';
    _controllerSenha.text = '';
  }



  @override
  Widget build(BuildContext context) {
    return body(context); 
  }
}