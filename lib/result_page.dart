import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/resusable_dart.dart';

import 'input_page.dart';
import 'package:flutter/material.dart';
import 'bottombutton.dart';



class ResultsPage extends StatelessWidget {
  ResultsPage({required this.type,required this.interpretation,required this.resulttext});
  final String type;
  final String resulttext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),

      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [

          Expanded(child: Container(
            child: Text('Your Result',style: ktitleTextStyle,),
          ),),
          Expanded(
            flex: 5,
            child: Reusablecard(
            onpress: (){},
            colour: kinactiveCardColour,
            cardChild: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Text(type,style: ktitlegTextStyle,),
                Text(resulttext,style: kbmiTextstyle,),
                Text(interpretation,style: ktitleTextStyle,),

              ],
            ),
          ),),
          BottomButton(press:()=> Navigator.pop(context), name: 'RE-CALCULATE',)
        ],
      ),
    );
  }
}
