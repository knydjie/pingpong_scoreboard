import 'package:flutter/material.dart';
import 'package:knytbt_pingpong_scoreboard/const/constants.dart';

//Round blue button (similar to reusable_button)
class ReusableCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ReusableCircleButton(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
        child: Icon(
          icon,
          color: lightestGreen,
        ),
      ),
      fillColor: buttonGreen,
      shape: const CircleBorder(),
    );
  }
}
