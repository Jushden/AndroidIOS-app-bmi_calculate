import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({required this.onPress,required this.colour,required this.cardChild,});

  final Color colour;
  final Widget cardChild;
  final void Function() onPress;

  /// container 容器在没有孩子的时候，宽度就是屏幕的宽度，一旦有了孩子，就会自适应为孩子的宽度

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}