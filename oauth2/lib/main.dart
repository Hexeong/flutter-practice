import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<GoogleSignInAccount?> _googleSignIn = GoogleSignIn().signIn();

    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          _googleSignIn;
        },
        child: Text("google"),
      ),
    );
  }
}