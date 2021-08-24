import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/gender.dart';
import '../components/reusable_card.dart';
import '../constant.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool? isMale;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  void initState() {
    super.initState();
    isMale = true;
  }

  void handleGender(bool checkMale) {
    if (checkMale) {
      setState(() {
        isMale = true;
      });
    } else {
      setState(() {
        isMale = false;
      });
    }
    print(isMale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      handleGender(true);
                    },
                    color:
                        (isMale == true ? kActivCardColor : kInactiveCardColor),
                    cardChild: Gender(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      handleGender(false);
                    },
                    color: (isMale == false
                        ? kActivCardColor
                        : kInactiveCardColor),
                    cardChild: Gender(
                      icon: FontAwesomeIcons.venus,
                      text: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActivCardColor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "HEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "cm",
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbColor: Color(0xFFEB1555),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xFF8D8E98),
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 12.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 24)),
                          child: Slider(
                              value: height.toDouble(),
                              onChanged: (double newHeight) {
                                setState(() {
                                  height = newHeight.toInt();
                                });
                              },
                              min: 120.0,
                              max: 220.0),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActivCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              heroTag: 'btn1',
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: Color(0xff4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: 'btn2',
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: Color(0xff4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActivCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              heroTag: 'btn3',
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: Color(0xff4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: 'btn4',
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Color(0xff4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              title: "CALCULATE",
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              })
        ],
      ),
    );
  }
}
