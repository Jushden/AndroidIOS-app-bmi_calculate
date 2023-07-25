import 'package:flutter/material.dart';
import 'screen/input_page.dart';


void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const InputPage(),
      // routes: {
      //   '/':(context)=> _InputPageState
      // },
    );
  }
}


