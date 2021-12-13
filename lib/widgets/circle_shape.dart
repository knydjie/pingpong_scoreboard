import 'package:flutter/material.dart';

//This will be used as the DOT to indicate the service order
class CircleShape extends StatelessWidget {
  final Color color;
  const CircleShape({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
