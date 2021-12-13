import 'package:flutter/material.dart';
import 'package:knytbt_pingpong_scoreboard/const/constants.dart';

//Switch toggle button that only accept TRUE/FALSE
class ReusableSwitch extends StatefulWidget {
  final bool value;
  final Function(bool) onChanged;

  const ReusableSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _ReusableSwitchState createState() => _ReusableSwitchState();
}

class _ReusableSwitchState extends State<ReusableSwitch> {
  @override
  Widget build(BuildContext context) {
    //Switch.adaptive will adapt its design to user's phone (ios/android)
    return Switch.adaptive(
      value: widget.value,
      onChanged: widget.onChanged,
      activeTrackColor: aBitGray,
      inactiveTrackColor: darkestBlue,
      activeColor: blueThumb,
      inactiveThumbColor: lightestGreen,
    );
  }
}
