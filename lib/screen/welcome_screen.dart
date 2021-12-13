import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:knytbt_pingpong_scoreboard/screen/configuration_screen.dart';
import 'package:knytbt_pingpong_scoreboard/const/constants.dart';
import 'package:knytbt_pingpong_scoreboard/widgets/reusable_button.dart';
// import 'package:knytbt_pingpong_scoreboard/class/ad_state.dart';
// import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // BannerAd? banner;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // final adState = Provider.of<AdState>(context);
  //   adState.initialization.then((status) {
  //     setState(
  //       () {
  //         banner = BannerAd(
  //           size: AdSize.banner,
  //           adUnitId: adState.bannerAdUnitId,
  //           request: const AdRequest(),
  //           listener: adState.bannerAdListener,
  //         );
  //         banner!.load();
  //       },
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'PINGPONG SCOREBOARD',
                    style: mainTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ReusableButton(
                    text: 'START',
                    onPressed: () {
                      Navigator.pushNamed(context, ConfigurationScreen.id);
                    },
                  ),
                ],
              ),
            ),
            // if (banner == null)
            //   SizedBox(height: 50)
            // else
            //   Container(
            //     height: 50,
            //     child: AdWidget(ad: banner!),
            //   ),
          ],
        ),
      ),
    ));
  }
}
