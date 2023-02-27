import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:signinfire/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signInWithGoogle();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue, // Background color
            onPrimary: Colors.white, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 50, vertical: 15), // Button padding
          ),
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 20, // Text font size
            ),
          ),
        ),
      ),
    );
  }

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);

    // if (userCredential.user !=null) {
    //   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => MyHomePage(title: 'Home page')));
    // }
  }
}
