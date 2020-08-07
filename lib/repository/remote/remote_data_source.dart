import 'dart:convert';
import 'package:expense/model/models.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  String baseUrl = "http://192.168.56.1:8000/api/v1";
  Future<SingleResponse<Token>> login(String email, String password) async {
    String url = "$baseUrl/login";

    var result =
        await http.post(url, body: {"email": email, "password": password});
    var object = json.decode(result.body);
    if (object['data'] != null) {
      object['data'] = Token.fromJson(object['data']);
    }
    return SingleResponse.fromJson(object);
  }
}
