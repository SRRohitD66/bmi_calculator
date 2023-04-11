import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resusable_dart.dart';
import 'constants.dart';
import 'bottombutton.dart';
import 'result_page.dart';
import 'calculativebrain.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Gender selectedGender = Gender.empty;
  int height = 180;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Reusablecard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kactiveCardColour
                        : kinactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Reusablecard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kactiveCardColour
                        : kinactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Reusablecard(
              colour: kinactiveCardColour,
              onpress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: klabelnTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height',
                        style: klabelTextStyle,
                      ),
                      Text(
                        'cm',
                        style: klabelnTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFFFFFFF),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      inactiveColor: Color(0xFF8D8E98),
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
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Reusablecard(
                    onpress: () {},
                    colour: kactiveCardColour,
                    cardChild: Column(
                      //crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: klabelnTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: klabelTextStyle,
                            ),
                            Text(
                              'Kg',
                              style: klabelnTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconBUtton(
                                function: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icons.remove),
                            RoundIconBUtton(
                                function: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icons.add)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Reusablecard(
                    onpress: () {},
                    colour: kactiveCardColour,
                    cardChild: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: klabelnTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: klabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconBUtton(
                                function: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icons.remove),
                            RoundIconBUtton(
                                function: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icons.add)
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
            press: () {
              CalculatorBrain calc =CalculatorBrain(height: height, weight: weight) ;

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(type: calc.calculateBMI(),interpretation: calc.getInterpretation(),resulttext: calc.getResult(),)));
            },
            name: 'Calculate',
          ),
        ],
      ),
    );
  }
}

class RoundIconBUtton extends StatelessWidget {
  const RoundIconBUtton({required this.function, required this.child});
  final Function function;
  final IconData child;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        function();
      },
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C445E),
      child: Icon(child),
    );
  }
}
