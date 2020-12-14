import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtp extends StatefulWidget {
  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  bool hasError = false;

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

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
                "Verifikasi Kode OTP",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Row(
                children: <Widget>[
                  Text("Kami telah mengirimkan kode OTP di E-Mail anda."),
                ],
              ),
            ),
            Container(
              child: PinCodeTextField(
                length: 6,
                textInputType: TextInputType.number,
                autoDismissKeyboard: true,
                obsecureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                ),
                backgroundColor: Colors.transparent,
                errorAnimationController: errorController,
                onChanged: (value) {},
                onCompleted: (value) {
                  Get.offNamed('/reset-password');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
