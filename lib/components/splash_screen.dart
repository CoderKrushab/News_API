import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Duration duration = const Duration(seconds: 5);
    Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('homepage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0EYLPKpRRyrNLI6ZjT7i8sigcOQhobV85tA&usqp=CAU",
          ),
          const SizedBox(height: 40),
          const CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 2,
          ),
        ],
      ),
    );
  }
}
