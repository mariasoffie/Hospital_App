import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hospital_app/Service/OnBoarding/HAOnboarding.dart';

class HALoadingScreen extends StatefulWidget {
  const HALoadingScreen({super.key});

  @override
  State<HALoadingScreen> createState() => _HALoadingScreenState();
}

class _HALoadingScreenState extends State<HALoadingScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return HAOnboardingPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 77, 60),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.height * 0.1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/logo.png"),
              )),
            )
          ]),
    );
  }
}
