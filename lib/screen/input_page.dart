import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { MALE, FEMALE }

/// 设为有状态的小部件，我们就可以实际更改卡的状态。
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectGender = Gender.MALE;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI CALCULATOR'),
        ),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: Column(
        /// crossAxisAlignment 可以将整个列的宽度放大
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectGender = Gender.MALE;
                  });
                },
                colour: selectGender == Gender.MALE
                    ? kInactiveCardColour
                    : kActiveCardColour,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: 'MALE',
                ),
              )),
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectGender = Gender.FEMALE;
                  });
                },
                colour: selectGender == Gender.FEMALE
                    ? kInactiveCardColour
                    : kActiveCardColour,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.venus,
                  label: 'FEMALE',
                ),
              )),
            ],
          )),
          Expanded(
              child: ReusableCard(
            onPress: () {},
            colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    const Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                onPress: () {},
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                onPress: () {},
                colour: const Color(0xFF1D1E33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      )
               ));
            },
          )
        ],
      ),
    );
  }
}
