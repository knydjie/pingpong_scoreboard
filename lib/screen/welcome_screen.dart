import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:knytbt_pingpong_scoreboard/screen/configuration_screen.dart';
import 'package:knytbt_pingpong_scoreboard/const/constants.dart';
import 'package:knytbt_pingpong_scoreboard/widgets/reusable_button.dart';
import 'package:knytbt_pingpong_scoreboard/class/ad_state.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  BannerAd? banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(
        () {
          banner = BannerAd(
            size: AdSize.banner,
            adUnitId: adState.bannerAdUnitId,
            request: const AdRequest(),
            listener: adState.bannerAdListener,
          );
          banner!.load();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
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
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildColorButton(
                              onTap: () {
                                setState(() {
                                  changeColorTheme(ColorTheme.green);
                                });
                              },
                              color: Colors.green),
                          const SizedBox(width: 30.0),
                          buildColorButton(
                              onTap: () {
                                setState(() {
                                  changeColorTheme(ColorTheme.blue);
                                });
                              },
                              color: Colors.blue),
                          const SizedBox(width: 30.0),
                          buildColorButton(
                              onTap: () {
                                setState(() {
                                  changeColorTheme(ColorTheme.purple);
                                });
                              },
                              color: Colors.purple),
                        ],
                      ),
                    ],
                  ),
                ),
                // if (banner == null)
                //   const SizedBox(height: 50)
                // else
                //   SizedBox(
                //     height: 50,
                //     child: AdWidget(ad: banner!),
                //   ),
              ],
            ),
          ),
        ));
  }

  GestureDetector buildColorButton({
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(3.0),
          child: ClipOval(
            child: Container(
              color: color,
              width: 30.0,
              height: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
