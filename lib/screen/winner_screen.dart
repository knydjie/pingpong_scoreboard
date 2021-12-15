import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knytbt_pingpong_scoreboard/const/constants.dart';
import 'package:knytbt_pingpong_scoreboard/screen/configuration_screen.dart';
import 'package:knytbt_pingpong_scoreboard/widgets/reusable_button.dart';
import 'package:knytbt_pingpong_scoreboard/widgets/reusable_card.dart';
import 'package:knytbt_pingpong_scoreboard/class/game_data.dart';

class WinnerScreen extends StatefulWidget {
  static const String id = 'winner_screen';

  const WinnerScreen({Key? key}) : super(key: key);

  @override
  _WinnerScreenState createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  @override
  Widget build(BuildContext context) {
    GameData gameData = ModalRoute.of(context)!.settings.arguments as GameData;

    //To check each match's point
    String playerOnePointMatchOne = gameData.playerOnePointMatchOne.toString();
    String playerOnePointMatchTwo = gameData.playerOnePointMatchTwo != null
        ? gameData.playerOnePointMatchTwo.toString()
        : '';
    String playerOnePointMatchThree = gameData.playerOnePointMatchThree != null
        ? gameData.playerOnePointMatchThree.toString()
        : '';
    String playerOnePointMatchFour = gameData.playerOnePointMatchFour != null
        ? gameData.playerOnePointMatchFour.toString()
        : '';
    String playerOnePointMatchFive = gameData.playerOnePointMatchFive != null
        ? gameData.playerOnePointMatchFive.toString()
        : '';
    String playerOnePointMatchSix = gameData.playerOnePointMatchSix != null
        ? gameData.playerOnePointMatchSix.toString()
        : '';
    String playerOnePointMatchSeven = gameData.playerOnePointMatchSeven != null
        ? gameData.playerOnePointMatchSeven.toString()
        : '';

    String playerTwoPointMatchOne = gameData.playerTwoPointMatchOne.toString();
    String playerTwoPointMatchTwo = gameData.playerTwoPointMatchTwo != null
        ? gameData.playerTwoPointMatchTwo.toString()
        : '';
    String playerTwoPointMatchThree = gameData.playerTwoPointMatchThree != null
        ? gameData.playerTwoPointMatchThree.toString()
        : '';
    String playerTwoPointMatchFour = gameData.playerTwoPointMatchFour != null
        ? gameData.playerTwoPointMatchFour.toString()
        : '';
    String playerTwoPointMatchFive = gameData.playerTwoPointMatchFive != null
        ? gameData.playerTwoPointMatchFive.toString()
        : '';
    String playerTwoPointMatchSix = gameData.playerTwoPointMatchSix != null
        ? gameData.playerTwoPointMatchSix.toString()
        : '';
    String playerTwoPointMatchSeven = gameData.playerTwoPointMatchSeven != null
        ? gameData.playerTwoPointMatchSeven.toString()
        : '';

    //WillPopScope here is used to override the back button
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ConfigurationScreen(),
          ),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: mainColor,
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                          cardChild: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Text('POINT',
                                                textAlign: TextAlign.center,
                                                style: pointResultTextStyle),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(playerOnePointMatchOne,
                                                style:
                                                    numberPointResultTextStyle),
                                            Text(playerOnePointMatchTwo,
                                                style:
                                                    numberPointResultTextStyle),
                                            Text(playerOnePointMatchThree,
                                                style:
                                                    numberPointResultTextStyle),
                                            Text(playerOnePointMatchFour,
                                                style:
                                                    numberPointResultTextStyle),
                                            Text(playerOnePointMatchFive,
                                                style:
                                                    numberPointResultTextStyle),
                                            Text(playerOnePointMatchSix,
                                                style:
                                                    numberPointResultTextStyle),
                                            Text(playerOnePointMatchSeven,
                                                style:
                                                    numberPointResultTextStyle),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: FittedBox(
                                          fit: BoxFit.fitHeight,
                                          child: Text(
                                            '${gameData.playerOneMatchWin}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              //TODO
                                              color: textGameScreenColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      'WINNER',
                                      style: winnerResultTextStyle.copyWith(
                                        color: gameData.playerOneMatchWin >
                                                gameData.playerTwoMatchWin
                                            ? mainColor
                                            : lightestColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          cardChild: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Expanded(
                                        child: FittedBox(
                                          fit: BoxFit.fitHeight,
                                          child: Text(
                                            '${gameData.playerTwoMatchWin}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              //TODO
                                              color: textGameScreenColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Text('POINT',
                                                textAlign: TextAlign.center,
                                                style: pointResultTextStyle),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(playerTwoPointMatchOne,
                                                style:
                                                    numberPointResultTextStyle),
                                            Text(playerTwoPointMatchTwo,
                                                style:
                                                    numberPointResultTextStyle),
                                            Text(playerTwoPointMatchThree,
                                                style:
                                                    numberPointResultTextStyle),
                                            Text(playerTwoPointMatchFour,
                                                style:
                                                    numberPointResultTextStyle),
                                            Text(playerTwoPointMatchFive,
                                                style:
                                                    numberPointResultTextStyle),
                                            Text(playerTwoPointMatchSix,
                                                style:
                                                    numberPointResultTextStyle),
                                            Text(playerTwoPointMatchSeven,
                                                style:
                                                    numberPointResultTextStyle),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      'WINNER',
                                      style: winnerResultTextStyle.copyWith(
                                        color: gameData.playerOneMatchWin >
                                                gameData.playerTwoMatchWin
                                            ? lightestColor
                                            : mainColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 30.0,
                    top: 23.0,
                    child: GestureDetector(
                      child: Icon(
                        Icons.arrow_back,
                        color: mainColor,
                        size: 30.0,
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ConfigurationScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 15.0, left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      gameData.playerOneName,
                      style: nameResultTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  ReusableButton(
                    text: 'NEW GAME',
                    onPressed: () {
                      Navigator.pushNamed(context, ConfigurationScreen.id);
                    },
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: Text(
                      gameData.playerTwoName,
                      style: nameResultTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
