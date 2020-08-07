import 'package:expense/bloc/base_event.dart';

class LoginEvent extends BaseEvent {
  final String email;
  final String password;

  const LoginEvent({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}
