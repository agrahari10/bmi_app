import 'package:flutter/material.dart';

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
