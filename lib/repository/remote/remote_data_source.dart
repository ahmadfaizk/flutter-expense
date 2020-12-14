import 'dart:convert';
import 'package:expense/model/models.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final String _baseUrl = "http://192.168.100.35:8000/api/v1";
  final http.Client httpClient;

  RemoteDataSource({this.httpClient});

  Future<SingleResponse<Token>> login(String email, String password) async {
    String url = "$_baseUrl/login";
    var result = await httpClient
        .post(url, body: {"email": email, "password": password});
    var object = json.decode(result.body);
    if (object['data'] != null) {
      object['data'] = Token.fromJson(object['data']);
    }
    return SingleResponse.fromJson(object);
  }

  Future<SingleResponse<String>> forgotPassword(String email) async {
    String url = "$_baseUrl/forgot-password";
    var result = await httpClient.post(url, body: {"email": email});
    var object = json.decode(result.body);
    return SingleResponse.fromJson(object);
  }

  Future<SingleResponse<String>> verifyOtp(String email, String otp) async {
    String url = "$_baseUrl/verify-otp";
    var result = await httpClient.post(url, body: {"email": email, "otp": otp});
    var object = json.decode(result.body);
    return SingleResponse.fromJson(object);
  }

  Future<SingleResponse<String>> resetPassword(
      String email, String otp, String password) async {
    String url = "$_baseUrl/reset-password";
    var result = await httpClient
        .post(url, body: {"email": email, "otp": otp, "password": password});
    var object = json.decode(result.body);
    return SingleResponse.fromJson(object);
  }
}
