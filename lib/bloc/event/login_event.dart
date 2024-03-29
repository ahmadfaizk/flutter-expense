import 'package:expense/bloc/event/base_event.dart';

class LoginEvent extends BaseEvent {
  final String email;
  final String password;

  const LoginEvent({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}

class LogoutEvent extends BaseEvent {
  const LogoutEvent();

  @override
  List<Object> get props => [];
}
