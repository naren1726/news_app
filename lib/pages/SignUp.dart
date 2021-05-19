import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/data/repository.dart';
import 'package:flutter_task/pages/widgets/base.dart';
import 'package:flutter_task/pages/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FocusNode passwordField = FocusNode();
  final FocusNode reEnterPasswordField = FocusNode();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfController = TextEditingController();

  Future<bool> signUp() async {
    return await Repository().register(_emailController.text,
        _passwordController.text, _passwordConfController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SignInUpBase(
      body: [
        SizedBox(height: 8),
        Text(
          "Sign Up",
          style: TextStyle(
              color: Color(0xFF031E46),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: TextField(
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
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(reEnterPasswordField),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: TextField(
            controller: _passwordConfController,
            focusNode: reEnterPasswordField,
            decoration: InputDecoration(
              hintText: "Re-enter-Password",
              hintStyle: TextStyle(color: Colors.white),
              fillColor: Color(0xffAA9B8A),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
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
            'Sign Up',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'WorkSansMedium'),
          ),
          onPressed: () async {
            if (await signUp()) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Registered Succesfully! Login to continue")));
              Navigator.of(context).pushNamed('/SignIn');
            } else
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Failed to register!")));
          },
        ),
        SizedBox(height: 8.0),
        GoogleFacebookButtons(),
        SizedBox(height: 8.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
              width: 70,
            ),
            Text(
              'Have an account?',
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
                'Sign in',
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16.0,
                    fontFamily: 'WorkSansMedium'),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/SignIn");
              },
            ),
          ],
        )
      ],
    );
    // child: Image.asset('assets/img/image1.jpg', fit: BoxFit.fill),
  }
}
