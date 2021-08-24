import '../components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../components/bottom_button.dart';
import '../constant.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage({
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActivCardColor,
              cardChild: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmiResult,
                      style:
                          TextStyle(fontSize: 85, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            title: "RE - CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
