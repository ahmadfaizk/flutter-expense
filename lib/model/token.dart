import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String type;
  final String token;
  final int expiredIn;

  const Token({this.type, this.token, this.expiredIn});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        type: json['type'],
        token: json['token'],
        expiredIn: json['expired_in']);
  }

  @override
  List<Object> get props => [type, token, expiredIn];
}
