import 'package:flutter/material.dart';

class GoogleFacebookButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.grey,
                width: 70.0,
                height: 2.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  'Or Sign In With',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'WorkSansMedium'),
                ),
              ),
              Container(
                color: Colors.grey,
                width: 70.0,
                height: 2.0,
              ),
            ],
          ),
        ),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/img/google.png', fit: BoxFit.fill),
              width: 40,
              height: 40,
              color: Colors.red,
            ),
            SizedBox(width: 30),
            Container(
              child: Image.asset('assets/img/fb.png', fit: BoxFit.fill),
              width: 40,
              height: 40,
              color: Colors.red,
            )
          ],
        ),
      ],
    );
  }
}
