import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      _getToken().then((value) =>
          (value == null) ? Get.offNamed('/login') : Get.offNamed('/home'));
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 150),
            Container(
              margin: EdgeInsets.only(top: 16, bottom: 48),
              child: Text(
                "Flutter Expense",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  Future<String> _getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("token");
  }
}
