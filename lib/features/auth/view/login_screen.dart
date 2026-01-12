import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/features/auth/view/register_screen.dart';
import 'package:note_app_with_firebase/features/home/view/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      // accessToken: ,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'login to continue using the app',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: email,
                    decoration: InputDecoration(
                      label: Text('Email'),
                      labelStyle: TextStyle(color: Colors.black),

                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),

                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),

                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: password,
                    decoration: InputDecoration(
                      label: Text('password'),
                      labelStyle: TextStyle(color: Colors.black),

                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),

                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),

                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: ()async{
                      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
                      AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          animType: AnimType.rightSlide,
                          // title: 'Dialog Title',

                          desc: 'check your email',
                      btnOkOnPress: () {},
                      ).show();
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minWidth: double.infinity,
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () async {
                      if (formState.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      } else {
                        print('not valid');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 20,
                      ),
                      child: Text('Login'),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(child: Text('or login with')),
                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          signInWithGoogle();
                        },
                        child: Text('Goodle'),
                      ),
                      InkWell(
                        onTap: () {
                          // signInWithGoogle();
                        },
                        child: Text('Goodle'),
                      ),
                      InkWell(
                        onTap: () {
                          // signInWithGoogle();
                        },
                        child: Text('Goodle'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
