import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class CalculButton extends StatelessWidget {

  final Function onTap;
  final String   label;

  CalculButton({this.onTap, this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: this.onTap,
        child: Container(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),
          color: kBottomBarColor,
          margin: EdgeInsets.only(top: 10.0),
        ),
      ),
    );
  }
}