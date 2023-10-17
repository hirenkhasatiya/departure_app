import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<splashscreen> {
  FlutterLogoStyle mystyle = FlutterLogoStyle.markOnly;

  changePage() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        mystyle = FlutterLogoStyle.horizontal;
      });
    });

    Timer.periodic(Duration(seconds: 4), (timer) {
      Navigator.of(context).pushReplacementNamed('/');

      timer.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    changePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 867,
          child: Image(
            image: AssetImage("assets/image/b1.png"),
          ),
        ),
      ),
    );
  }
}
