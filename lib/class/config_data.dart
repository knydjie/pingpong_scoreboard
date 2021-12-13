//Configuration data will be passed as this object
class ConfigData {
  final String playerOneName;
  final String playerTwoName;
  final bool playerOneStartsFirst;
  final int totalMatch;

  ConfigData({
    required this.playerOneName,
    required this.playerTwoName,
    required this.playerOneStartsFirst,
    required this.totalMatch,
  });
}
