import 'package:expense/bloc/bloc.dart';
import 'package:expense/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidePassword = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Container(
          margin: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      labelText: "Email atau Username",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Email atau Username harus diisi";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 8),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: _isHidePassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        labelText: "Password",
                        suffixIcon: Container(
                          child: IconButton(
                            icon: Icon(
                              _isHidePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () => _togglePasswordVisibility(),
                          ),
                        )),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password harus diisi";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        child: Text("Forgot Password ?"),
                        onPressed: () {
                          Get.offNamed('/forgot-password');
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text("Login"),
                    shape: StadiumBorder(),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        BlocProvider.of<LoginBloc>(context).add(LoginEvent(
                            email: emailController.text,
                            password: passwordController.text));
                      }
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
                        _saveToken(state.data.token)
                            .then((value) => Get.offNamed('/home'));
                        return Container();
                      } else if (state is LoadingState) {
                        return CircularProgressIndicator();
                      } else {
                        return Container();
                      }
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _saveToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }
}
