import 'package:flutter/material.dart';

class ExpContainer extends StatelessWidget {

  final Widget cardChild;
  final Color color;
  final int   flex;

  ExpContainer({this.cardChild, @required this.color, this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        child: this.cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class GestureCont extends StatelessWidget {

  final Widget cardChild;
  final Color color;
  final Function onPress;

  GestureCont({this.cardChild, @required this.color, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        child: this.cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
