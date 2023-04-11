import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.icon,required this.label});

  final String label;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          label,
          style:
          TextStyle(color: Color(0xFF8D8E98), fontSize: 18),
        ),
      ],
    );
  }
}