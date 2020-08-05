import 'package:expense/model/single_response.dart';
import 'package:expense/model/token.dart';
import 'package:expense/service/login_service.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;
  bool isLoading = false;
  SingleResponse<Token> response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Container(
          margin: EdgeInsets.all(16),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 24),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: "Email atau Username"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 8),
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
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: <Widget>[
                          FlatButton(
                            child: Text("Forgot Password ?"),
                            onPressed: () {
                              Navigator.pushNamed(context, '/forgot_password');
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text("Login"),
                        shape: StadiumBorder(),
                        onPressed: () {
                          final snackbar = SnackBar(
                              content: Row(
                                children: <Widget>[
                                  CircularProgressIndicator(),
                                  Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Text("Loading..."),
                                  )
                                ],
                              ),
                              duration: Duration(days: 365));
                          Scaffold.of(context).showSnackBar(snackbar);
                          LoginService.login("ahmad", "ahmad").then((value) {
                            setState(() {
                              response = value;
                            });
                            Scaffold.of(context).hideCurrentSnackBar();
                          });
                        },
                      ),
                    ),
                    Container(
                      child: Text(
                          (response != null) ? response.data.token : "Kosong"),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
