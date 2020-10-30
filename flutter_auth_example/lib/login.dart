import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'main.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print('--------------------------loading LoginScreen');
    return Container(
      child: Scaffold(
          body: Center(
              child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Inside login screen'),
          ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential user = await signInWithGoogle();
                  print(user);

                  if (user != null) {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) =>MyHomePage(title:user.user.displayName)));
                  } else {
                    //some error occurred
                  }
                } on FirebaseAuthException catch (e) {
                  print('Error ---------------  : ${e.message}');
                } on PlatformException catch (e) {
                  print('Error ---------------  : ${e.message}');
                }
              },
              child: Text('Login with Google'))
        ],
      ))),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    final UserCredential userCred =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print('----------------------------->' + userCred.user.email);
    return userCred;
  }
}
