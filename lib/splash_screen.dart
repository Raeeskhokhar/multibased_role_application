import 'dart:async';
import 'package:ch9_shared/student_screen.dart';
import 'package:ch9_shared/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ch9_shared/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    bool isLogin = sp.getBool('isLogin') ?? false;
    String usertype = sp.getString('usertype') ?? '';
    if (isLogin) {
      if (usertype == 'student') {
        Timer(Duration(seconds: 3), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => StudentScreen(),
              ));
        });
      } else if (usertype == 'Teacher') {
        Timer(Duration(seconds: 3), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TeacherScreen(),
              ));
        });
      } else {
        Timer(Duration(seconds: 3), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        });
      }
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 200),
            Icon(
              FontAwesomeIcons.whatsapp,
              size: 50,
              color: Colors.green,
            ),
            Column(
              children: [
                SizedBox(height: 220),
                Text(
                  'from',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.meta,
                      color: Colors.green,
                    ),
                    SizedBox(width: 10),
                    Text('Meta')
                  ],
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
