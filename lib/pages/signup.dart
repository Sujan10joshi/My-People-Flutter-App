import 'package:flutter/material.dart';
import 'package:wikiandfact/pages/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [Color(0xff050A30), Color(0xff381AB0)],
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 60.0),
                _userNameField(),
                _userEmailField(),
                _userContactNumberField(),
                _registerButton(),
                _logInText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _userNameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xffe5dcf2),
            ),
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffe5dcf2)),
                ),
                hintText: "Full Name",
                hintStyle: TextStyle(
                  color: Color(0xffe5dcf2),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xffe5dcf2),
                )),
          ),
        ],
      ),
    );
  }

  _userEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xffe5dcf2),
            ),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffe5dcf2)),
                ),
                hintText: "Email",
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

  _userContactNumberField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xffe5dcf2),
            ),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffe5dcf2)),
                ),
                hintText: "Contact Number",
                hintStyle: TextStyle(
                  color: Color(0xffe5dcf2),
                ),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Color(0xffe5dcf2),
                )),
          ),
        ],
      ),
    );
  }

  _registerButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            child: const Text(
              'Register',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(0.0, 45.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _logInText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(55.0, 10.0, 0.0, 0.0),
      child: Row(
        children: [
          const Text(
            'Already have an account?',
            style: TextStyle(
              fontSize: 18.0,
              letterSpacing: 1.4,
              color: Color(0xffe5dcf2),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 1.4,
                fontWeight: FontWeight.bold,
                color: Color(0xffe5dcf2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
