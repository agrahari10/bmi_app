import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeCardcolor = Colors.red;
const inactiveCardcolor = Colors.black;

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
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        child: Reusable_card(
                          colour: selectedGender == Gender.male
                              ? activeCardcolor
                              : inactiveCardcolor,
                          cardchild: ContantCard(
                            icon: FontAwesomeIcons.mars,
                            label: 'Male',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        child: Reusable_card(
                          colour: selectedGender == Gender.female
                              ? activeCardcolor
                              : inactiveCardcolor,
                          cardchild: ContantCard(
                            icon: FontAwesomeIcons.venus,
                            label: 'Female',
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                Expanded(
                  child: Reusable_card(
                    colour: Colors.black54,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Reusable_card(
                          colour: Colors.black54,
                        ),
                      ),
                      Expanded(
                        child: Reusable_card(
                          colour: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink),
                )
              ],
            ),
          ),
        ));
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
          size: 80.0,
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

class Reusable_card extends StatelessWidget {
  Reusable_card({this.colour, this.cardchild});

  final Color colour;
  final Widget cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild,
      // height: 30,
      // width: 10,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
