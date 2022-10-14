import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travelin/pages/get_started.dart';
import 'package:travelin/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  var _visible = true;

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => GetStartedPage()));
  }
  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
         duration: new Duration(seconds: 3), vsync: this);
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: animation.value * 100,
              height: animation.value * 100,
              margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/icon_plane.png"),
              )),
            ),
            Text(
              "TRAVELIN",
              style: whiteTextStyle.copyWith(
                  fontSize: 32, fontWeight: medium, letterSpacing: 10),
            ),
          ],
        ),
      ),
    );
  }
}
