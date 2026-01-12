import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/features/auth/view/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          leading: IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ),

        body: FirebaseAuth.instance.currentUser!.emailVerified?
        Text('welcome'):
        ElevatedButton(onPressed: () {
          FirebaseAuth.instance.currentUser!.sendEmailVerification();

        },
            child: Text('verify email')),
      ),
    );
  }
}
