import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/general_class.dart';
import 'package:bmi_calculator/components/calcul_button.dart';

class ResultPage extends StatelessWidget {

  final String bmi;
  final String result;
  final String interpretation;

  ResultPage({@required this.bmi, @required this.result, @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'BMI Calculator',
        style: TextStyle(
          fontFamily: 'Poppins',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              'Your Result :',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kGreyText,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ExpContainer(
            flex: 5,
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  this.result.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: (this.result == 'Normal') ? Colors.green : Colors.red,
                  ),
                ),
                Text(
                  this.bmi,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                    fontSize: 110.0,
                  ),
                ),
                Text(
                  this.interpretation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ]
            ),
          ),
          CalculButton(
            label: 'RE-CALCULATE',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}