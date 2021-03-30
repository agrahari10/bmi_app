import 'package:bmi_app/constent.dart';
import 'package:bmi_app/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
ResultPage({@required this.bmiResult,@required this.interpatation,@required this.resultText});

  final String bmiResult;
  final String  resultText;
  final String interpatation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'YOUR RESULT',
                style: kLargeButton,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusable_card(
              colour: inactiveCardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: cLargeButton,
                  ),
                  Text(
                    bmiResult,
                    style: ktitle,
                  ),
                  Text(
                    interpatation,
                    textAlign: TextAlign.center,
                    style: kbodystyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTittle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
