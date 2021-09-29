import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:crime_watch/main.dart';

class SignInService{

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      dynamic result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      }  // if result not null we simply call the MaterialpageRoute,

    }
  }

  }
