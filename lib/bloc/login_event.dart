import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class FetchLogin extends LoginEvent {
  final String email;
  final String password;

  const FetchLogin({this.email, this.password});
  @override
  List<Object> get props => [email, password];
}
