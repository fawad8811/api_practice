import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hiring_task_fawad/constants/text_styles.dart';
import 'package:hiring_task_fawad/screens/navbar_screen.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:get/get.dart';
import '../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        Get.off(NavBarScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Assets.pngImagesSplashImage, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromRGBO(12, 12, 12, 0),
                  const Color(0xFF0C0C0C),
                ],
                stops: [0.0, 1.3],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(70)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('My Store', style: MyTextStyle.f50W400(context)),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      Text('Valkommen', style: MyTextStyle.f14W400(context, fontWeight: FontWeight.w600, color: Colors.white)),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      Text('Hos ass kan du baka tid has nastan alla\nSveriges salonger och motagningar. Baka \nfrisor, massage, skonhetsbehandingar, \nfriskvard och mycket mer.',
                          textAlign: TextAlign.center, style: MyTextStyle.f12W400(context, color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
