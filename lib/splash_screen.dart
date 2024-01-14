import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/sign_In.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    @override
  void initState() {
      super.initState();

      Timer(Duration(seconds: 5),(){

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>SignIn(),
            ));

      });

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage("https://static.apksmods.com/images/en/com.weatherteam.rainy.forecast.radar.widgets/icon.png"),
          fit: BoxFit.cover
        )
      ),
     ),

    );
  }
}
