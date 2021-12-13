import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:knytbt_pingpong_scoreboard/class/ad_state.dart';
import 'package:knytbt_pingpong_scoreboard/screen/configuration_screen.dart';
import 'package:knytbt_pingpong_scoreboard/screen/welcome_screen.dart';
import 'package:knytbt_pingpong_scoreboard/screen/winner_screen.dart';
import 'package:knytbt_pingpong_scoreboard/screen/game_screen.dart';
import 'package:flutter/services.dart';
import 'package:knytbt_pingpong_scoreboard/const/constants.dart';
// import 'package:provider/provider.dart';

Future main() async {
  //Mobile ads initialization
  WidgetsFlutterBinding.ensureInitialized();
  // final initFuture = MobileAds.instance.initialize();
  // final adState = AdState(initFuture);
  //Screen will stay landscape
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  //Status bar (battery, signal, etc) will be hidden
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(const MyApp()
      // Provider.value(
      //   value: adState,
      //   builder: (context, child) => const MyApp(),
      // ),
      );
}

class MyApp extends StatelessWidget {
  final String title = 'PINGPONG SCOREBOARD';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: mainGreen,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        ConfigurationScreen.id: (context) => const ConfigurationScreen(),
        GameScreen.id: (context) => const GameScreen(),
        WinnerScreen.id: (context) => const WinnerScreen(),
      },
    );
  }
}
