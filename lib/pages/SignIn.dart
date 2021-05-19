import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/data/repository.dart';
import 'package:flutter_task/pages/widgets/base.dart';
import 'package:flutter_task/pages/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FocusNode passwordField = FocusNode();
  final FocusNode reEnterPasswordField = FocusNode();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<bool> signIn() async {
    return await Repository()
        .login(_emailController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SignInUpBase(
      body: [
        SizedBox(height: 8),
        Text(
          "Sign In",
          style: TextStyle(
              color: Color(0xFF031E46),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.white),
              fillColor: Color(0xffAA9B8A),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(passwordField);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: TextField(
            controller: _passwordController,
            focusNode: passwordField,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.white),
              fillColor: Color(0xffAA9B8A),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.blue[800],
                      decoration: TextDecoration.underline),
                )),
          ],
        ),
        SizedBox(height: 8.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            textStyle: TextStyle(color: Colors.white),
            primary: Colors.blue,
          ),
          child: Text(
            'Sign In',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'WorkSansMedium'),
          ),
          onPressed: () async {
            if (await signIn())
              Navigator.of(context).pushNamed('/home');
            else
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Invalid Email/Password")));
          },
        ),
        SizedBox(height: 8.0),
        GoogleFacebookButtons(),
        SizedBox(height: 12.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
              width: 70,
            ),
            Text(
              "Don't have an account?",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontFamily: 'WorkSansMedium'),
            ),
            SizedBox(
              height: 10,
              width: 6,
            ),
            InkWell(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16.0,
                      fontFamily: 'WorkSansMedium'),
                ),
                onTap: () => Navigator.pop(context)),
          ],
        )
      ],
    );
  }
}
