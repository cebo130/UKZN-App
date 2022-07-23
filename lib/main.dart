
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ukzn_app/screens/browser_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get_it/get_it.dart';



void main(){
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const vidDown());
}

class vidDown extends StatefulWidget {
  const vidDown({Key? key}) : super(key: key);

  @override
  State<vidDown> createState() => _vidDownState();
}

class _vidDownState extends State<vidDown> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/images/uk.png',
        ),
        splashIconSize: 160,
        nextScreen: BrowserPage(),
        splashTransition: SplashTransition.scaleTransition,

        //backgroundColor: Colors.orange,
      ),
    );
  }
}

