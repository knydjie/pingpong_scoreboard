//Game data will be passed as this object
class GameData {
  final int playerOneMatchWin;
  final int playerTwoMatchWin;
  final String playerOneName;
  final String playerTwoName;
  int playerOnePointMatchOne;
  int? playerOnePointMatchTwo;
  int? playerOnePointMatchThree;
  int? playerOnePointMatchFour;
  int? playerOnePointMatchFive;
  int? playerOnePointMatchSix;
  int? playerOnePointMatchSeven;
  int playerTwoPointMatchOne;
  int? playerTwoPointMatchTwo;
  int? playerTwoPointMatchThree;
  int? playerTwoPointMatchFour;
  int? playerTwoPointMatchFive;
  int? playerTwoPointMatchSix;
  int? playerTwoPointMatchSeven;

  GameData({
    required this.playerOneMatchWin,
    required this.playerTwoMatchWin,
    required this.playerOneName,
    required this.playerTwoName,
    required this.playerOnePointMatchOne,
    this.playerOnePointMatchTwo,
    this.playerOnePointMatchThree,
    this.playerOnePointMatchFour,
    this.playerOnePointMatchFive,
    this.playerOnePointMatchSix,
    this.playerOnePointMatchSeven,
    required this.playerTwoPointMatchOne,
    this.playerTwoPointMatchTwo,
    this.playerTwoPointMatchThree,
    this.playerTwoPointMatchFour,
    this.playerTwoPointMatchFive,
    this.playerTwoPointMatchSix,
    this.playerTwoPointMatchSeven,
  });
}
