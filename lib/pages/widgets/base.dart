import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInUpBase extends StatelessWidget {
  SignInUpBase({this.body});

  final List<Widget> body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff524C48),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/img/image2.jpg', fit: BoxFit.fill),
          ),
          Column(
            children: [
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: Column(
                    children: body,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
