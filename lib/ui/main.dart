import 'package:expense/bloc/bloc.dart';
import 'package:expense/repository/repositories.dart';
import 'package:expense/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ExpenseRepository repository = ExpenseRepository(
      remoteDataSource: RemoteDataSource(httpClient: http.Client()));
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(repository: repository),
        ),
        BlocProvider<ForgotPasswordBloc>(
          create: (context) => ForgotPasswordBloc(repository: repository),
        )
      ],
      child: GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()),
          GetPage(name: '/login', page: () => Login()),
          GetPage(name: '/forgot-password', page: () => ForgotPassword()),
          GetPage(name: '/verify-otp', page: () => VerifyOtp()),
          GetPage(name: '/reset-password', page: () => ResetPassword()),
          GetPage(name: '/home', page: () => Home()),
          GetPage(name: '/profile', page: () => Profile())
        ],
      ),
    );
  }
}
