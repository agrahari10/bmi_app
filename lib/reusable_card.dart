import 'package:flutter/material.dart';
import 'constent.dart';

class Reusable_card extends StatelessWidget {
  Reusable_card({this.colour, this.cardchild,this.onpressed});

  final Color colour;
  final Widget cardchild;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    Size Screensize1 = MediaQuery.of(context).size;
    // Size Screensize2 = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: Screensize1.height,
        width: Screensize1.width,
        child: cardchild,
        // height: 30,
        // width: 10,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}