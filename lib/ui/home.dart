import 'package:expense/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Selamat Datang"),
            RaisedButton(
                child: Text("Logout"),
                onPressed: () {
                  _logout().then(
                      (value) => Navigator.pushReplacementNamed(context, '/'));
                  BlocProvider.of<LoginBloc>(context).add(LogoutEvent());
                })
          ],
        ),
      ),
    );
  }

  Future<bool> _logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.clear();
  }
}
