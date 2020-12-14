import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 24),
              child: Text(
                "Reset Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: TextField(
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    )),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                shape: StadiumBorder(),
                textColor: Colors.white,
                child: Text("Reset"),
                onPressed: () {
                  Get.offAllNamed('/login');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
