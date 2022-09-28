import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orange, width: 1.5),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orange, width: 1.5),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2),
  ),
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
