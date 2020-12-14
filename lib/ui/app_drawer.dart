import 'package:expense/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Ahmad Faiz"),
            accountEmail: Text("ach.faiz.k@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: Text("AF"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
            onTap: () {
              Get.back();
              Get.toNamed('/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text("Cash Advance"),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.attachment),
            title: Text("Reimburse"),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.done_outline),
            title: Text("Approval"),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Profile"),
            onTap: () {
              Get.back();
              Get.toNamed('/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () {
              Get.back();
              _showLogoutDialog();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    return showDialog(
      context: Get.context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Anda akan keluar dari applikasi ini ?"),
          actions: [
            FlatButton(
              child: Text("Yes"),
              onPressed: () {
                Get.back();
                _logout().then((value) => Get.offAllNamed('/'));
                BlocProvider.of<LoginBloc>(context).add(LogoutEvent());
              },
            ),
            FlatButton(
              child: Text("Tidak"),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> _logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.clear();
  }
}
