import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/features/auth/view/login_screen.dart';
import 'package:note_app_with_firebase/features/home/view/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  GlobalKey<FormState> formState=GlobalKey();

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(
                  //   child: Image.network(
                  //     'https://cdn-icons-png.flaticon.com/512/8345/8345570.png',
                  //     height: 80,
                  //     width: 80,
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
                  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'enter your personal information',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(   validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                    controller: userName,
                    decoration: InputDecoration(
                      label: Text('UserName'),
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
                      hintText: 'Enter your username',
                      hintStyle: TextStyle(color: Colors.grey),
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
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.grey),
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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: confirm_password,
                    decoration: InputDecoration(
                      label: Text(' confirm password'),
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
                      hintText: 'confirm your password',
                      hintStyle: TextStyle(color: Colors.grey),
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
                      try {
                        final  credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                              email: email.text.trim(),
                              password: password.text.trim(),
                            );
                        print('Registration successful: ${credential.user?.email}');

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e, s) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Registration failed')),
                        );
                        print('ERROR---------------------------: $e');
                        print('STACKTRACE----------------------: $s');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 20,
                      ),
                      child: Text('Sign Up'),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('you have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'login',
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
