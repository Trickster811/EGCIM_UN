import 'dart:async';

import 'package:egcim_un/welcome/auth/signin_page.dart';
import 'package:egcim_un/welcome/start_page.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  // final List<String>? userInfo;
  const LoadingScreen({
    Key? key,
    // required this.userInfo,
  }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // startTime();
    start();
  }

  start() async {
    // startTime();
    startTime1();
  }

  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  startTime1() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route1);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MyHomePage(
          accountType: 'admin',
        ),
      ),
    );
  }

  route1() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 228, 228, 228),
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Stack(
      children: [
        // Positioned(
        //   right: -MediaQuery.of(context).size.width * 0.5,
        //   bottom: 0,
        //   child: Image.asset(
        //     'assets/images/EGCIM-logo.png',
        //     opacity: Animation.fromValueListenable(opacity: 5),
        //     colorBlendMode: BlendMode.modulate,
        //     // width: MediaQuery.of(context).size.width * 3,
        //     height: MediaQuery.of(context).size.height * 0.6,
        //   ),
        // ),
        SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/EGCIM-logo.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'EGCIM UN',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'School App',
                  style: TextStyle(
                    fontSize: 10,
                    // color: Colors.black45,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
