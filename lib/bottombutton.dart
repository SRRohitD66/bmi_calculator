import 'package:flutter/material.dart';
import 'constants.dart';
import 'result_page.dart';
import 'input_page.dart';


class BottomButton extends StatelessWidget {
  BottomButton({required this.press,required this.name});
  final Function press;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        press();

      },
      child: Container(
        child: Center(child: Text(name,style: klargeButtonText)),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        padding: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}