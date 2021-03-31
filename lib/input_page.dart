import 'package:bmi_app/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'constent.dart';
import 'result.dart';
import 'calculatyor_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Reusable_card(
                        onpressed: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? activeCardcolor
                            : inactiveCardcolor,
                        cardchild: ContantCard(
                          icon: FontAwesomeIcons.mars,
                          label: 'Male',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Reusable_card(
                        onpressed: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? activeCardcolor
                            : inactiveCardcolor,
                        cardchild: ContantCard(
                          icon: FontAwesomeIcons.venus,
                          label: 'Female',
                        ),
                      ),
                    ),
                  ],
                )),
                Expanded(
                  child: Reusable_card(
                    colour: Colors.black54,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHfT',
                          style: lableTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.toString(), style: knumberText),
                            Text(
                              'cm',
                              style: lableTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.pink,
                              inactiveTrackColor: Colors.white,
                              thumbColor: Colors.pink,
                              overlayColor: Colors.white,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15.0,
                              ),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 18.0)),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            // activeColor: Colors.red,

                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Reusable_card(
                          colour: Colors.black54,
                          cardchild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('WEIGHT', style: lableTextStyle),
                              Text(
                                weight.toString(),
                                style: knumberText,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onpressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onpressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Reusable_card(
                          colour: Colors.black54,
                          cardchild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('AGE', style: lableTextStyle),
                              Text(
                                age.toString(),
                                style: knumberText,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onpressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onpressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  )
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
                  buttonTittle: 'CALCULATE',
                  onTap: () {

                    CalBrain calc = CalBrain(height: height, weight: weight);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            interpatation: calc.getInterpatation(),
                            bmiResult: calc.calculateBmi(),
                            resultText: calc.getResult(),
                          ),
                        ));
                  },
                )
              ],
            ),
          ),
        ));
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTittle});
  final Function onTap;
  final String buttonTittle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          buttonTittle,
          style: LargeButton,
        )),
        height: MediaQuery.of(context).size.height * 0.1,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.pink),
      ),
    );
  }
}

class ContantCard extends StatelessWidget {
  ContantCard({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: MediaQuery.of(context).size.height * 0.1,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: 18.0,
              color: Color(0xFF8D8E98),
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onpressed});

  final IconData icon;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      disabledElevation: 6.0,
      onPressed: onpressed,
      constraints: BoxConstraints.tightFor(width: 40.0, height: 40.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
