import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:knytbt_pingpong_scoreboard/screen/winner_screen.dart';
import 'package:knytbt_pingpong_scoreboard/const/constants.dart';
import 'package:knytbt_pingpong_scoreboard/widgets/reusable_button.dart';
import 'package:knytbt_pingpong_scoreboard/widgets/reusable_card.dart';
import 'package:knytbt_pingpong_scoreboard/class/config_data.dart';
import 'package:knytbt_pingpong_scoreboard/widgets/reusable_circle_button.dart';
import 'package:knytbt_pingpong_scoreboard/widgets/circle_shape.dart';
import 'package:knytbt_pingpong_scoreboard/widgets/dialog_box.dart';
import 'package:knytbt_pingpong_scoreboard/class/game_data.dart';
import 'package:knytbt_pingpong_scoreboard/widgets/dialog_box_one_button.dart';

Color playerOneColor = playerOneService ? mainColor : lightestColor;
Color playerTwoColor = playerOneService ? lightestColor : mainColor;

late bool playerOneService;

late int playerOnePointMatchOne;
int? playerOnePointMatchTwo;
int? playerOnePointMatchThree;
int? playerOnePointMatchFour;
int? playerOnePointMatchFive;
int? playerOnePointMatchSix;
int? playerOnePointMatchSeven;
late int playerTwoPointMatchOne;
int? playerTwoPointMatchTwo;
int? playerTwoPointMatchThree;
int? playerTwoPointMatchFour;
int? playerTwoPointMatchFive;
int? playerTwoPointMatchSix;
int? playerTwoPointMatchSeven;

class GameScreen extends StatefulWidget {
  static const String id = 'game_screen';

  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int matchNth = 1;
  int serviceNth = 1;
  List<int> serviceFirst = [1, 2, 5, 6, 9, 10, 13, 14, 17, 18];
  List<int> serviceSecond = [3, 4, 7, 8, 11, 12, 15, 16, 19, 20];

  int playerOnePoint = 0;
  int playerTwoPoint = 0;

  int playerOneMatchWin = 0;
  int playerTwoMatchWin = 0;

  @override
  Widget build(BuildContext context) {
    final configData = ModalRoute.of(context)!.settings.arguments as ConfigData;

    playerOneService = configData.playerOneStartsFirst;

    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                          cardChild: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 10.0,
                              ),
                              //First Player
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    configData.playerOneName,
                                    style: TextStyle(
                                      //TODO
                                      color: textGameScreenColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    '$playerOnePoint',
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
                                child: CircleShape(
                                  color: playerOneColor,
                                ),
                              ),
                            ],
                          ),
                          onPress: () {
                            setState(() {
                              // print('ADD ICON FIRST PLAYER');
                              playerOnePoint++;
                              serviceNth++;

                              playerOneService = checkService(configData);
                              updateColor();

                              // print('serviceNth: $serviceNth');
                              // print('playerOneService: $playerOneService');
                              // print('playerOnePoint: $playerOnePoint');
                              checkMatchWinnerForAdd(
                                playerOnePoint,
                                playerTwoPoint,
                                configData,
                              );
                              // print(
                              //     'playerOneMatchWin!!!!!!!!!$playerOneMatchWin');
                              // print(
                              //     'playerTwoMatchWin!!!!!!!!!$playerTwoMatchWin');
                              //
                              // print('END ADD ICON FIRST PLAYER');
                            });
                          }),
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 10.0,
                            ),
                            //Second Player
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  configData.playerTwoName,
                                  style: TextStyle(
                                    //TODO
                                    color: textGameScreenColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  '$playerTwoPoint',
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
                              child: CircleShape(
                                color: playerTwoColor,
                              ),
                            ),
                          ],
                        ),
                        onPress: () {
                          setState(() {
                            //print('ADD ICON SECOND PLAYER');
                            playerTwoPoint++;
                            serviceNth++;

                            playerOneService = checkService(configData);
                            updateColor();

                            // print('serviceNth: $serviceNth');
                            // print('playerOneService: $playerOneService');
                            // print('playerTwoPoint: $playerTwoPoint');
                            checkMatchWinnerForAdd(
                              playerOnePoint,
                              playerTwoPoint,
                              configData,
                            );
                            // print(
                            //     'playerOneMatchWin!!!!!!!!!$playerOneMatchWin');
                            // print(
                            //     'playerTwoMatchWin!!!!!!!!!$playerTwoMatchWin');
                            // print('END ADD ICON FIRST PLAYER');
                          });
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        playerOneMatchWin.toString(),
                        style: TextStyle(
                          fontSize: 30.0,
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 70.0),
                      Text(
                        playerTwoMatchWin.toString(),
                        style: TextStyle(
                          fontSize: 30.0,
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
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
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //FirstPlayer

                ReusableCircleButton(
                  icon: Icons.remove,
                  onPressed: () {
                    setState(() {
                      if (playerOnePoint > 0) {
                        //print('SUBTRACT ICON FIRST PLAYER');
                        playerOnePoint--;
                        serviceNth--;

                        playerOneService = checkService(configData);
                        updateColor();

                        //print('serviceNth: $serviceNth');
                        //print('playerOneService: $playerOneService');
                        //print('playerOnePoint: $playerOnePoint');
                        checkMatchWinnerForSubtract(
                          playerOnePoint,
                          playerTwoPoint,
                          configData,
                        );
                        //print('playerOneMatchWin!!!!!!!!!$playerOneMatchWin');
                        //print('playerTwoMatchWin!!!!!!!!!$playerTwoMatchWin');

                        //print('END SUBTRACT ICON FIRST PLAYER');
                      }
                    });
                  },
                ),
                ReusableCircleButton(
                  icon: Icons.add,
                  onPressed: () {
                    setState(() {
                      // print('ADD ICON FIRST PLAYER');
                      playerOnePoint++;
                      serviceNth++;

                      playerOneService = checkService(configData);
                      updateColor();

                      // print('serviceNth: $serviceNth');
                      // print('playerOneService: $playerOneService');
                      // print('playerOnePoint: $playerOnePoint');
                      checkMatchWinnerForAdd(
                        playerOnePoint,
                        playerTwoPoint,
                        configData,
                      );
                      // print('playerOneMatchWin!!!!!!!!!$playerOneMatchWin');
                      // print('playerTwoMatchWin!!!!!!!!!$playerTwoMatchWin');

                      // print('END ADD ICON FIRST PLAYER');
                    });
                  },
                ),
                //RESET
                ReusableButton(
                  text: 'RESET',
                  onPressed: () {
                    setState(() {
                      resetMatch(configData);
                      // print('RESET CHECK');
                      // print('playerOnePoint:$playerOnePoint');
                      // print('playerTwoPoint:$playerTwoPoint');
                      // print('playerOneService:$playerOneService');
                      // print('RESET CHECK END');
                    });
                  },
                ),
                //Second Player
                ReusableCircleButton(
                  icon: Icons.remove,
                  onPressed: () {
                    setState(() {
                      if (playerTwoPoint > 0) {
                        //print('SUBTRACT ICON SECOND PLAYER');
                        playerTwoPoint--;
                        serviceNth--;

                        playerOneService = checkService(configData);
                        updateColor();

                        //print('serviceNth: $serviceNth');
                        //print('playerOneService: $playerOneService');
                        //print('playerTwoPoint: $playerTwoPoint');
                        checkMatchWinnerForSubtract(
                          playerOnePoint,
                          playerTwoPoint,
                          configData,
                        );
                        //print('playerOneMatchWin!!!!!!!!!$playerOneMatchWin');
                        //print('playerTwoMatchWin!!!!!!!!!$playerTwoMatchWin');

                        //print('END SUBTRACT ICON SECOND PLAYER');
                      }
                    });
                  },
                ),
                ReusableCircleButton(
                  icon: Icons.add,
                  onPressed: () {
                    setState(() {
                      // print('ADD ICON SECOND PLAYER');
                      playerTwoPoint++;
                      serviceNth++;

                      playerOneService = checkService(configData);
                      updateColor();

                      // print('serviceNth: $serviceNth');
                      // print('playerOneService: $playerOneService');
                      // print('playerTwoPoint: $playerTwoPoint');
                      checkMatchWinnerForAdd(
                        playerOnePoint,
                        playerTwoPoint,
                        configData,
                      );
                      // print('playerOneMatchWin!!!!!!!!!$playerOneMatchWin');
                      // print('playerTwoMatchWin!!!!!!!!!$playerTwoMatchWin');
                      //
                      // print('END ADD ICON SECOND PLAYER');
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Reset each matches' points when navigate to the winner screen
  void clearPointData() {
    playerOnePointMatchTwo = null;
    playerOnePointMatchThree = null;
    playerOnePointMatchFour = null;
    playerOnePointMatchFive = null;
    playerOnePointMatchSix = null;
    playerOnePointMatchSeven = null;
    playerTwoPointMatchTwo = null;
    playerTwoPointMatchThree = null;
    playerTwoPointMatchFour = null;
    playerTwoPointMatchFive = null;
    playerTwoPointMatchSix = null;
    playerTwoPointMatchSeven = null;
  }

  void confirmWinner(
      int playerOneMatchWin, int playerTwoMatchWin, ConfigData configData) {
    int canWinIf = configData.totalMatch;

    if (playerOneMatchWin == canWinIf) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => ReusableOneButtonDialogBox(
          title: 'GAME OVER',
          description: 'The winner will be announced',
          onTapCheck: () {
            Navigator.pushNamed(
              context,
              WinnerScreen.id,
              arguments: GameData(
                playerOneMatchWin: playerOneMatchWin,
                playerTwoMatchWin: playerTwoMatchWin,
                playerOneName: configData.playerOneName,
                playerTwoName: configData.playerTwoName,
                playerOnePointMatchOne: playerOnePointMatchOne,
                playerOnePointMatchTwo: playerOnePointMatchTwo,
                playerOnePointMatchThree: playerOnePointMatchThree,
                playerOnePointMatchFour: playerOnePointMatchFour,
                playerOnePointMatchFive: playerOnePointMatchFive,
                playerOnePointMatchSix: playerOnePointMatchSix,
                playerOnePointMatchSeven: playerOnePointMatchSeven,
                playerTwoPointMatchOne: playerTwoPointMatchOne,
                playerTwoPointMatchTwo: playerTwoPointMatchTwo,
                playerTwoPointMatchThree: playerTwoPointMatchThree,
                playerTwoPointMatchFour: playerTwoPointMatchFour,
                playerTwoPointMatchFive: playerTwoPointMatchFive,
                playerTwoPointMatchSix: playerTwoPointMatchSix,
                playerTwoPointMatchSeven: playerTwoPointMatchSeven,
              ),
            );
            clearPointData();
          },
        ),
      );
    } else if (playerTwoMatchWin == canWinIf) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => ReusableOneButtonDialogBox(
          title: 'GAME OVER',
          description: 'The winner will be announced',
          onTapCheck: () {
            Navigator.pushNamed(
              context,
              WinnerScreen.id,
              arguments: GameData(
                playerOneMatchWin: playerOneMatchWin,
                playerTwoMatchWin: playerTwoMatchWin,
                playerOneName: configData.playerOneName,
                playerTwoName: configData.playerTwoName,
                playerOnePointMatchOne: playerOnePointMatchOne,
                playerOnePointMatchTwo: playerOnePointMatchTwo,
                playerOnePointMatchThree: playerOnePointMatchThree,
                playerOnePointMatchFour: playerOnePointMatchFour,
                playerOnePointMatchFive: playerOnePointMatchFive,
                playerOnePointMatchSix: playerOnePointMatchSix,
                playerOnePointMatchSeven: playerOnePointMatchSeven,
                playerTwoPointMatchOne: playerTwoPointMatchOne,
                playerTwoPointMatchTwo: playerTwoPointMatchTwo,
                playerTwoPointMatchThree: playerTwoPointMatchThree,
                playerTwoPointMatchFour: playerTwoPointMatchFour,
                playerTwoPointMatchFive: playerTwoPointMatchFive,
                playerTwoPointMatchSix: playerTwoPointMatchSix,
                playerTwoPointMatchSeven: playerTwoPointMatchSeven,
              ),
            );
            clearPointData();
          },
        ),
      );
    }
  }

  //If user pressed V (go to the next match) in the dialog box, each players' point will be stored for that match
  //playerOne : playerTwo = 11 : 0 in match 1. Then, playerOnePointMatchOne = 11 & playerTwoPointMatchOne = 0
  void saveMatchPoint(int matchNth) {
    if (matchNth == 1) {
      playerOnePointMatchOne = playerOnePoint;
      playerTwoPointMatchOne = playerTwoPoint;
    } else if (matchNth == 2) {
      playerOnePointMatchTwo = playerOnePoint;
      playerTwoPointMatchTwo = playerTwoPoint;
    } else if (matchNth == 3) {
      playerOnePointMatchThree = playerOnePoint;
      playerTwoPointMatchThree = playerTwoPoint;
    } else if (matchNth == 4) {
      playerOnePointMatchFour = playerOnePoint;
      playerTwoPointMatchFour = playerTwoPoint;
    } else if (matchNth == 5) {
      playerOnePointMatchFive = playerOnePoint;
      playerTwoPointMatchFive = playerTwoPoint;
    } else if (matchNth == 6) {
      playerOnePointMatchSix = playerOnePoint;
      playerTwoPointMatchSix = playerTwoPoint;
    } else if (matchNth == 7) {
      playerOnePointMatchSeven = playerOnePoint;
      playerTwoPointMatchSeven = playerTwoPoint;
    }
  }

  //Check if there is already a winner in a match. This method is for the + button
  //In 2nd match out of 5, playerOne got 13 and playerTwo got 11, so the score is valid (has 2 points difference)
  //Then the winner is playerOne, and will show a dialog to confirm the match
  //Press X: the last score will be undone. Press V: score will be saved and will be directed to next match
  void checkMatchWinnerForAdd(
      int pointPlayerOne, int pointPlayerTwo, ConfigData configData) {
    int pointDifference = pointPlayerOne - pointPlayerTwo;

    if (pointPlayerOne >= 11 && pointDifference >= 2) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => ReusableDialogBox(
          title: 'FINISH THIS MATCH?',
          description: 'The score will be recorded for this match',
          onTapClose: () {
            setState(() {
              playerOnePoint--;
              serviceNth--;
              playerOneService = checkService(configData);
              updateColor();
            });

            Navigator.pop(context);

            // print('serviceNth!!! $serviceNth');
            // print('playerOnePoint!!! $pointPlayerOne');
          },
          onTapCheck: () {
            setState(() {
              playerOneMatchWin++;
              saveMatchPoint(matchNth);
              matchNth++;
              resetMatch(configData);
            });

            Navigator.pop(context);
            confirmWinner(playerOneMatchWin, playerTwoMatchWin, configData);

            // print('CHECK WINNER');
            // print('serviceNth!!! $serviceNth');
            // print('playerOnePoint!!! $pointPlayerOne');
            // print('matchNth!!! $matchNth');
            // print('CHECK WINNER END');
          },
        ),
      );
    } else if (pointPlayerTwo >= 11 && -pointDifference >= 2) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => ReusableDialogBox(
          title: 'FINISH THIS MATCH?',
          description: 'The score will be recorded for this match',
          onTapClose: () {
            setState(() {
              playerTwoPoint--;
              serviceNth--;
              playerOneService = checkService(configData);
              updateColor();
            });

            Navigator.pop(context);

            // print('serviceNth!!! $serviceNth');
            // print('playerOnePoint!!! $pointPlayerTwo');
          },
          onTapCheck: () {
            setState(() {
              playerTwoMatchWin++;
              saveMatchPoint(matchNth);
              matchNth++;
              resetMatch(configData);
            });

            Navigator.pop(context);
            confirmWinner(playerOneMatchWin, playerTwoMatchWin, configData);

            // print('CHECK WINNER');
            // print('serviceNth!!! $serviceNth');
            // print('playerTwoPoint!!! $pointPlayerTwo');
            // print('matchNth!!! $matchNth');
            // print('CHECK WINNER END');
          },
        ),
      );
    }
  }

  //Check if there is already a winner in a match. This method is for the - button
  void checkMatchWinnerForSubtract(
      int pointPlayerOne, int pointPlayerTwo, ConfigData configData) {
    int pointDifference = pointPlayerOne - pointPlayerTwo;

    if (pointPlayerOne >= 11 && pointDifference >= 2) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => ReusableDialogBox(
          title: 'FINISH THIS MATCH?',
          description: 'The score will be recorded for this match',
          onTapClose: () {
            setState(() {
              playerTwoPoint++;
              serviceNth++;
              playerOneService = checkService(configData);
              updateColor();
            });

            Navigator.pop(context);

            // print('serviceNth!!! $serviceNth');
            // print('playerOnePoint!!! $pointPlayerOne');
          },
          onTapCheck: () {
            setState(() {
              playerOneMatchWin++;
              saveMatchPoint(matchNth);
              matchNth++;
              resetMatch(configData);
            });

            Navigator.pop(context);
            confirmWinner(playerOneMatchWin, playerTwoMatchWin, configData);

            // print('CHECK WINNER');
            // print('serviceNth!!! $serviceNth');
            // print('playerOnePoint!!! $pointPlayerOne');
            // print('matchNth!!! $matchNth');
            // print('CHECK WINNER END');
          },
        ),
      );
    } else if (pointPlayerTwo >= 11 && -pointDifference >= 2) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => ReusableDialogBox(
          title: 'FINISH THIS MATCH?',
          description: 'The score will be recorded for this match',
          onTapClose: () {
            setState(() {
              playerOnePoint++;
              serviceNth++;
              playerOneService = checkService(configData);
              updateColor();
            });

            Navigator.pop(context);

            // print('serviceNth!!! $serviceNth');
            // print('playerOnePoint!!! $pointPlayerTwo');
          },
          onTapCheck: () {
            setState(() {
              playerTwoMatchWin++;
              saveMatchPoint(matchNth);
              matchNth++;
              resetMatch(configData);
            });

            Navigator.pop(context);
            confirmWinner(playerOneMatchWin, playerTwoMatchWin, configData);

            // print('CHECK WINNER');
            // print('serviceNth!!! $serviceNth');
            // print('playerTwoPoint!!! $pointPlayerTwo');
            // print('matchNth!!! $matchNth');
            // print('CHECK WINNER END');
          },
        ),
      );
    }
  }

  //If user press V in dialog box (go to the next match), then the UI will be reset
  void resetMatch(ConfigData configData) {
    playerOnePoint = 0;
    playerTwoPoint = 0;
    serviceNth = 1;
    playerOneService = configData.playerOneStartsFirst ? true : false;
    updateColor();
  }

  //To check the service order (based on the DOT)
  //From 1st service to the 20th (until deuce 10:10), service order is based on the list serviceFirst & serviceSecond
  //After deuce, service order is based on Odd & Even
  bool checkService(ConfigData configData) {
    if (serviceNth < 21) {
      if (configData.playerOneStartsFirst) {
        if (serviceFirst.contains(serviceNth)) {
          // print('1 P1 service');
          return true;
        } else if (serviceSecond.contains(serviceNth)) {
          // print('2 P2 service');
          return false;
        }
      } else {
        if (serviceSecond.contains(serviceNth)) {
          // print('3 P1 service');
          return true;
        } else if (serviceFirst.contains(serviceNth)) {
          // print('4 P2 service');
          return false;
        }
      }
    } else {
      if (configData.playerOneStartsFirst) {
        if (serviceNth.isOdd) {
          // print('A P1 service');
          return true;
        } else if (serviceNth.isEven) {
          // print('B P2 service');
          return false;
        }
      } else {
        if (serviceNth.isEven) {
          // print('C P1 service');
          return true;
        } else if (serviceNth.isOdd) {
          // print('D P2 service');
          return false;
        }
      }
    }
    throw '!!!!!!!!!!';
  }

  //Check color for the DOT based on boolean playerOneService
  //If TRUE, then playerOne will be doing the service. FALSE, then playerTwo will be doing the service
  //If mainBlue (dark blue), it means that player will be doing the service
  Color checkColorPlayerOne(bool playerOneService) {
    if (playerOneService) {
      return mainColor;
    } else {
      return lightestColor;
    }
  }

  Color checkColorPlayerTwo(bool playerOneService) {
    if (playerOneService) {
      return lightestColor;
    } else {
      return mainColor;
    }
  }

  //Update the DOT color on the UI. Use checkColorPlayer[One/Two] method above
  void updateColor() {
    playerOneColor = checkColorPlayerOne(playerOneService);
    playerTwoColor = checkColorPlayerTwo(playerOneService);
  }
}
