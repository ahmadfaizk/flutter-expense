import 'package:expense/bloc/login_bloc.dart';
import 'package:expense/bloc/login_event.dart';
import 'package:expense/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool passwordVisible = false;
    bool isLoading = false;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                        controller: emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: "Email atau Username"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 8),
                      child: TextField(
                        controller: passwordController,
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
                                // setState(() {
                                //   passwordVisible = !passwordVisible;
                                // });
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
                          BlocProvider.of<LoginBlock>(context).add(FetchLogin(
                              email: emailController.text,
                              password: passwordController.text));
                        },
                      ),
                    ),
                    Container(child: BlocBuilder<LoginBlock, LoginState>(
                        builder: (context, state) {
                      if (state is LoginEmpty) {
                        return Text("Belum Login");
                      } else if (state is LoginError) {
                        return Text((state).message);
                      } else if (state is LoginSuccess) {
                        return Text((state).token.token);
                      } else if (state is LoginLoading) {
                        return CircularProgressIndicator();
                      } else {
                        return Text("Tidak Login");
                      }
                    }))
                  ],
                ),
        ),
      ),
    );
  }
}
