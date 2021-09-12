import 'package:flutter/material.dart';

class BackLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: stack(),
    );
  }
}

Widget stack() {
  return Stack(
    children: <Widget>[image(), gradientBack()],
  );
}

Widget gradientBack() {
  return Opacity(
    opacity: .6,
    child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF000000), Color(0xFF000000)],
              begin: FractionalOffset(1, .1),
              end: FractionalOffset(1, .9))),
    ),
  );
}

Widget image() {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/splash1.jpg'), fit: BoxFit.cover)),
  );
}
/* FFFF46 AMARILLO*/
