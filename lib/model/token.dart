class Token {
  String type;
  String token;
  int expiredIn;

  Token({this.type, this.token, this.expiredIn});

  factory Token.make(Map<String, dynamic> object) {
    return Token(
        type: object['type'],
        token: object['token'],
        expiredIn: object['expired_in']);
  }
}
