import 'package:flutter/material.dart';
import 'package:knytbt_pingpong_scoreboard/const/constants.dart';

//White container that is able to use VoidCallback (onPress)
class ReusableCard extends StatelessWidget {
  final Widget? cardChild;
  final VoidCallback? onPress;

  const ReusableCard({Key? key, this.cardChild, this.onPress})
      : super(key: key); //gk wajib ada child

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: cardChild,
        ),
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: lightestGreen,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
