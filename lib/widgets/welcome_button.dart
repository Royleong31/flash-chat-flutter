import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;
  WelcomeButton({this.title, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(title, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
