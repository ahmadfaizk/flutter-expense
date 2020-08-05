import 'package:expense/fogot_password.dart';
import 'package:expense/home.dart';
import 'package:expense/login.dart';
import 'package:expense/reset_password.dart';
import 'package:expense/verify_otp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      routes: {
        '/login': (context) => Login(),
        '/forgot_password': (context) => ForgotPassword(),
        '/verify_otp': (context) => VerifyOtp(),
        '/reset_password': (context) => ResetPassword(),
        '/home': (context) => Home()
      },
    );
  }
}
