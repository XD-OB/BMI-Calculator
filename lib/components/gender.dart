import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

enum Gender {
  none,
  male,
  female,
}

class GenderContent extends StatelessWidget {

  final IconData iconData;
  final String label;

  GenderContent({this.iconData, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.iconData,
          color: Color(0xE0E0E0E0),
          size: 70.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
