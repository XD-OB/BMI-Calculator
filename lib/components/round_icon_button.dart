import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function function;

  RoundIconButton({@required this.icon, @required this.function});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.function,
      child: Icon(icon),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: kStyleColor,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}