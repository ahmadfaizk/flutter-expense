import 'package:expense/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
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
                "Forgot Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Text("Masukkan Email Anda")),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 24),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    labelText: "Email"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text("Send"),
                shape: StadiumBorder(),
                onPressed: () {
                  BlocProvider.of<ForgotPasswordBloc>(context)
                      .add(ForgotPasswordEvent(email: emailController.text));
                },
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 24),
                child: BlocBuilder<ForgotPasswordBloc, BaseState>(
                    builder: (context, state) {
                  if (state is EmptyState) {
                    return Text("Belum Forgot");
                  } else if (state is ErrorState) {
                    return Text((state).message);
                  } else if (state is SuccessState<String>) {
                    // print("Success state");
                    // Navigator.pushReplacementNamed(context, '/verify_otp');
                    // return Container();
                    return Text(state.data);
                  } else if (state is LoadingState) {
                    return CircularProgressIndicator();
                  } else {
                    return Text("Tidak Forgot");
                  }
                }))
          ],
        ),
      ),
    );
  }
}
