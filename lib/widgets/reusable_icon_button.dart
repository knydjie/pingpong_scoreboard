import 'package:flutter/material.dart';
import 'package:knytbt_pingpong_scoreboard/const/constants.dart';

//Icon button that has no background (only icon)
class ReusableIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;
  const ReusableIconButton(
      {Key? key,
      this.icon = Icons.close,
      this.color = lightestGreen,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        icon,
        color: color,
      ),
      onTap: onPressed,
    );
  }
}
