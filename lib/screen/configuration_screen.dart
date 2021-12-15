import 'package:flutter/material.dart';
import 'package:knytbt_pingpong_scoreboard/screen/game_screen.dart';
import 'package:knytbt_pingpong_scoreboard/const/constants.dart';
import 'package:knytbt_pingpong_scoreboard/screen/welcome_screen.dart';
import 'package:knytbt_pingpong_scoreboard/widgets/reusable_button.dart';
import 'package:knytbt_pingpong_scoreboard/widgets/reusable_switch.dart';
import 'package:knytbt_pingpong_scoreboard/widgets/reusable_icon_button.dart';
import 'package:knytbt_pingpong_scoreboard/class/config_data.dart';

class ConfigurationScreen extends StatefulWidget {
  static const String id = 'configuration_screen';

  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  _ConfigurationScreenState createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  final _formKey = GlobalKey<FormState>(); //Key to access form

  String playerOneName = 'Defender';
  String playerTwoName = 'Challenger';
  bool playerOneStartsFirst = true;
  bool playerTwoStartsFirst = false;
  int totalMatch = 1;

  final TextEditingController _textControllerOne =
      TextEditingController(text: 'Defender');
  final TextEditingController _textControllerTwo =
      TextEditingController(text: 'Challenger');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: <Widget>[
                  const Text(
                    'CONFIGURATION',
                    style: mainTitleTextStyle,
                  ),
                  Row(
                    children: <Widget>[
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                'Best of',
                                style: TextStyle(color: lightestColor),
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: lightestColor,
                                  inactiveTrackColor: aBitColor,
                                  thumbColor: thumbColor,
                                  thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 15.0),
                                  overlayShape: const RoundSliderOverlayShape(
                                      overlayRadius: 30.0),
                                  inactiveTickMarkColor: darkestColor,
                                  overlayColor: const Color(0x2999CCFF),
                                  valueIndicatorShape:
                                      const PaddleSliderValueIndicatorShape(),
                                  valueIndicatorColor: lightestColor,
                                  valueIndicatorTextStyle: TextStyle(
                                      color: darkestColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                child: Slider(
                                  value: totalMatch.toDouble(),
                                  min: 1,
                                  max: 4,
                                  divisions: 3,
                                  label: totalMatch.toString(),
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        totalMatch = value.toInt();
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('1',
                                    style: TextStyle(
                                      color: lightestColor,
                                      fontSize: 10.0,
                                    )),
                                Text('2',
                                    style: TextStyle(
                                      color: lightestColor,
                                      fontSize: 10.0,
                                    )),
                                Text('3',
                                    style: TextStyle(
                                      color: lightestColor,
                                      fontSize: 10.0,
                                    )),
                                Text('4',
                                    style: TextStyle(
                                      color: lightestColor,
                                      fontSize: 10.0,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 40.0,
                      ),
                      Flexible(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                style: TextStyle(color: lightestColor),
                                onChanged: (value) {
                                  setState(() {
                                    playerOneName = value;
                                  });
                                },
                                controller: _textControllerOne,
                                decoration: textFieldDecoration.copyWith(
                                  //Button X to clear TextField
                                  suffixIcon: ReusableIconButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          _textControllerOne.clear();
                                        },
                                      );
                                    },
                                    color: lightestColor,
                                  ),
                                ),
                                cursorColor: lightestColor,
                                maxLength: 10,
                                validator: (value) => value!.isEmpty
                                    ? 'The name cannot be empty'
                                    : null,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              TextFormField(
                                style: TextStyle(color: lightestColor),
                                onChanged: (value) {
                                  setState(() {
                                    playerTwoName = value;
                                  });
                                },
                                controller: _textControllerTwo,
                                decoration: textFieldDecoration.copyWith(
                                  labelText: 'Player 2',
                                  suffixIcon: ReusableIconButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          _textControllerTwo.clear();
                                          // print(
                                          //     'playerOneStartsFirst: $playerOneStartsFirst');
                                          // print(
                                          //     'playerTwoStartsFirst: $playerTwoStartsFirst');
                                        },
                                      );
                                    },
                                    color: lightestColor,
                                  ),
                                ),
                                cursorColor: lightestColor,
                                maxLength: 10, //Max name's character is 10
                                validator: (value) => value!
                                        .isEmpty //To check if the TextField is empty
                                    ? 'The name cannot be empty' //Return this if empty
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 40.0),
                      Column(
                        children: <Widget>[
                          //Switch to choose which player get the first service
                          ReusableSwitch(
                            value: playerOneStartsFirst,
                            onChanged: (value) {
                              setState(() {
                                playerOneStartsFirst = value;
                                playerTwoStartsFirst =
                                    playerOneStartsFirst == true ? false : true;
                              });
                            },
                          ),
                          Text(
                            playerOneStartsFirst ? 'Service' : '',
                            style: TextStyle(color: lightestColor),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ReusableSwitch(
                            value: playerTwoStartsFirst,
                            onChanged: (value) {
                              setState(() {
                                playerTwoStartsFirst = value;
                                playerOneStartsFirst =
                                    playerTwoStartsFirst == true ? false : true;
                              });
                            },
                          ),
                          Text(
                            playerOneStartsFirst ? '' : 'Service',
                            style: TextStyle(color: lightestColor),
                          ),
                          const SizedBox(height: 15.0),
                        ],
                      )
                    ],
                  ),
                  ReusableButton(
                    text: 'START GAME',
                    onPressed: () {
                      //Will check the validator for every TextField
                      final isValid = _formKey.currentState!.validate();

                      //If valid, navigate to the next screen and pass configData object as arguments
                      if (isValid) {
                        _formKey.currentState!.save();
                        ConfigData configData = ConfigData(
                            playerOneName: playerOneName,
                            playerTwoName: playerTwoName,
                            playerOneStartsFirst: playerOneStartsFirst,
                            totalMatch: totalMatch);

                        Navigator.pushNamed(
                          context,
                          GameScreen.id,
                          arguments: configData,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
