import 'package:expense/bloc/bloc.dart';
import 'package:expense/repository/repositories.dart';
import 'package:expense/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ExpenseRepository repository =
      ExpenseRepository(remoteDataSource: RemoteDataSource());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBlock>(
          create: (context) => LoginBlock(repository: repository),
        ),
        BlocProvider<PasswordBloc>(
          create: (context) => PasswordBloc(),
        )
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => Login(),
          '/forgot_password': (context) => ForgotPassword(),
          '/verify_otp': (context) => VerifyOtp(),
          '/reset_password': (context) => ResetPassword(),
          '/home': (context) => Home()
        },
      ),
    );
  }
}
