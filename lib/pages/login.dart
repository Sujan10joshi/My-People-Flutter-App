import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wikiandfact/pages/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // initialize firebase app
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const LoginPage();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Login function
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found fot this email");
      }
    }

    return user;
  }

  //creating the textfield controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff050A30), Color(0xff381AB0)],
        begin: Alignment.center,
        end: Alignment.bottomCenter,
      )),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _wikiLogo(),
            _emailField(),
            _passwordField(),
            _forgetPassText(),
            _loginButton(),
            _signUpText(),
          ],
        ),
      ),
    );
  }

  Widget _wikiLogo() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 30.0),
      child: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('images/wikiandfact_logo.png'),
          radius: 70.0,
        ),
      ),
    );
  }

  _emailField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xffe5dcf2),
            ),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffe5dcf2)),
                ),
                hintText: "User Email",
                hintStyle: TextStyle(
                  color: Color(0xffe5dcf2),
                ),
                prefixIcon: Icon(
                  Icons.mail,
                  color: Color(0xffe5dcf2),
                )),
          ),
        ],
      ),
    );
  }

  _passwordField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
      child: Column(
        children: [
          TextField(
            controller: _passwordController,
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xffe5dcf2),
            ),
            obscureText: true,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffe5dcf2)),
                ),
                hintText: 'User Password',
                hintStyle: TextStyle(
                  color: Color(0xffe5dcf2),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xffe5dcf2),
                )),
          ),
        ],
      ),
    );
  }

  _forgetPassText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text(
            'Forget Password?',
            style: TextStyle(
              color: Color(0xffe5dcf2),
              fontSize: 14.0,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  _loginButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            child: const Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(0.0, 45.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            onPressed: () async {
              User? user = await loginUsingEmailPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                  context: context);
              print(user);
              if (user != null) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ProfileScreen()));
              }
            },
          ),
        ],
      ),
    );
  }

  _signUpText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(80.0, 40.0, 0.0, 0.0),
      child: Row(
        children: const [
          Text(
            'Don\'t have an account? Sign Up',
            style: TextStyle(
              color: Color(0xffe5dcf2),
              fontSize: 15.0,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
