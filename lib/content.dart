import 'package:flutter/material.dart';

import 'constent.dart';

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
          style: lableTextStyle,
        )
      ],
    );
  }
}
