import 'package:expense/ui/app_drawer.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      drawer: AppDrawer(),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Center(
          child: Text("Halaman Profile"),
        ),
      ),
    );
  }
}
