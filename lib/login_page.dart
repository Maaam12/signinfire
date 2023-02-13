// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SignUpWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Padding(
//     padding: EdgeInsets.all(32),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Spacer(),
//         FlutterLogo(size: 120),
//         Spacer(),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Hey There',
//             style: TextStyle(
//               fontSize: 32,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),  
//         SizedBox(height: 8,)
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Sign up to get started',
//             style: TextStyle(
//               fontSize: 16,
//             ),
//           ),
//         ),
//         Spacer(),
//         SizedBox(height: 40),
//         RichText(
//           text: TextSpan(
//             text: 'Alrdy have acc?',
//             children: [
//               TextSpan(
//                 text: 'Sign In',
//                 style: TextStyle(
//                   color: Colors.blue,
//                 ),
//               ),
//             ],
//             ]))
//         )
//     ]),);
// }



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
          onPressed: (){
            signInWithGoogle();
          },
          child: Text('Login'),
        ),
      ),
    );
  }

  signInWithGoogle() async {

    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential= GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);

    // if (userCredential.user !=null) {
    //   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => MyHomePage(title: 'Home page')));
    // } 
  }
}