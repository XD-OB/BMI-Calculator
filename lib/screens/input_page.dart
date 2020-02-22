import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/general_class.dart';
import 'package:bmi_calculator/components/calcul_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/gender.dart';
import 'package:bmi_calculator/calculator_bmi.dart';
import 'package:bmi_calculator/constants.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  bool   isMale(Gender gender) => (gender == Gender.male) ? true : false;
  bool   isFemale(Gender gender) => (gender == Gender.female) ? true : false;
  Gender gender = Gender.none;
  int    height = 180;
  int    weight = 60;
  int    age = 18;

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureCont(
                      onPress: () => setState(() {
                        gender = !isMale(gender) ? Gender.male : Gender.none;
                      }),
                      color: isMale(gender) ? kMaleColor : kInactiveCardColor,
                      cardChild: GenderContent(
                        iconData: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureCont(
                      onPress: () => setState(() {
                        gender = !isFemale(gender) ? Gender.female : Gender.none;
                      }),
                      color: isFemale(gender) ? kFemaleColor : kInactiveCardColor,
                      cardChild: GenderContent(
                        iconData: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: GestureCont(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNbrTextStyle,
                        ),
                        Text(
                          ' cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey.shade800,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 13.0,
                        ),
                        thumbColor: kBottomBarColor,
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 25.0
                        ),
                        overlayColor: kBottomBarColor.withAlpha(41),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: kMinHeight,
                        max: kMaxHeight,
                        onChanged: (double newHeight) {
                          setState(() => height = newHeight.round());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: <Widget>[
                  ExpContainer(
                    flex: 1,
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                             'WEIGHT',
                             style: kLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  weight.toString(),
                                  style: kNbrTextStyle,
                                ),
                                Text(
                                  ' Kg',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                          ]
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              function: () => setState(() => weight < kMaxWeight ? weight++ : 0),
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              function: () => setState(() => weight > kMinWeight ? weight-- : 0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ExpContainer(
                    color: kActiveCardColor,
                    flex: 1,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                            children: <Widget>[
                              Text(
                                'AGE',
                                style: kLabelTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    age.toString(),
                                    style: kNbrTextStyle,
                                  ),
                                  Text(
                                    ' yrs',
                                    style: kLabelTextStyle,
                                  ),
                                ],
                              ),
                            ]
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              function: () => setState(() => age < kMaxAge ? age++ : 0),
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              function: () => setState(() => age > kMinAge ? age-- : 0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CalculButton(
              label: 'CALCULATE',
              onTap: () {
                CalculatorBmi calculatorBmi = CalculatorBmi(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ResultPage(
                      bmi: calculatorBmi.calculateBMI(),
                      result: calculatorBmi.getResult(),
                      interpretation: calculatorBmi.getInterpretation(),
                    );
                  }),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}