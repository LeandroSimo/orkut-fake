import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends ChangeNotifier{
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService(){
    _authCheck();
  }

  _authCheck(){
    
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }
}

class Authentification{

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if(googleUser != null){
      final googleAuth = await googleUser.authentication;
      if(googleAuth.idToken != null){
        var userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken
          ),
        );
        return userCredential.user;
      }
    }else{
      throw FirebaseAuthException(
        message: "Sign in aborded by user",
        code: "ERROR_ABORDED_BY_USER",
      );
    }
  }

  Future<void> signOut() async{
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signIn();
    await _firebaseAuth.signOut();
  }

}