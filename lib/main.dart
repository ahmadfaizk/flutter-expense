import 'package:expense/bloc/login_bloc.dart';
import 'package:expense/data/expense_repository.dart';
import 'package:expense/data/remote/remote_data_source.dart';
import 'package:expense/fogot_password.dart';
import 'package:expense/home.dart';
import 'package:expense/login.dart';
import 'package:expense/reset_password.dart';
import 'package:expense/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<LoginBlock>(
        create: (context) => LoginBlock(
            repository:
                ExpenseRepository(remoteDataSource: RemoteDataSource())),
        child: Login(),
      ),
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
