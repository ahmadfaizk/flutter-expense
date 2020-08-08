import 'package:expense/bloc/bloc.dart';
import 'package:expense/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      child: BlocBuilder<PasswordBloc, bool>(
                        builder: (context, state) => TextField(
                          controller: passwordController,
                          obscureText: state,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              labelText: "Password",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  state
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  BlocProvider.of<PasswordBloc>(context)
                                      .add(!state);
                                },
                              )),
                        ),
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
                          BlocProvider.of<LoginBloc>(context).add(LoginEvent(
                              email: emailController.text,
                              password: passwordController.text));
                        },
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 24),
                        child: BlocBuilder<LoginBloc, BaseState>(
                            builder: (context, state) {
                          if (state is EmptyState) {
                            return Text("Belum Login");
                          } else if (state is ErrorState) {
                            return Text((state).message);
                          } else if (state is SuccessState<Token>) {
                            print("Success state");
                            _saveToken(state.data.token).then((value) =>
                                Navigator.pushReplacementNamed(
                                    context, '/home'));
                            return Container();
                          } else if (state is LoadingState) {
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

  _saveToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
  }
}
