import 'dart:async'; // Import the dart:async library

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tast_app/sign_up.dart';
import 'package:tast_app/task_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool('islogin') ?? false;
    Timer(const Duration(seconds: 3), () {
      if (islogin) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskScreen(userName: '')),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Sign_up()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        fit: BoxFit.fitHeight,
        height: double.infinity,
        image: NetworkImage(
            'https://images.pexels.com/photos/3585074/pexels-photo-3585074.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      ),
    );
  }
}
