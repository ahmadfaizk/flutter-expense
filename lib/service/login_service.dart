import 'dart:convert';
import 'package:expense/model/single_response.dart';
import 'package:expense/model/token.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<SingleResponse<Token>> login(
      String email, String password) async {
    String apiUrl = "http://192.168.1.7:8000/api/v1/login";

    var result =
        await http.post(apiUrl, body: {"email": email, "password": password});
    var jsonObject = json.decode(result.body);

    jsonObject['data'] = Token.make(jsonObject['data']);
    return SingleResponse.make(jsonObject);
  }
}
