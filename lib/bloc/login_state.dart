import 'package:equatable/equatable.dart';
import 'package:expense/model/models.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginEmpty extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String message;
  const LoginError({this.message});

  @override
  List<Object> get props => [message];
}

class LoginSuccess extends LoginState {
  final Token token;
  const LoginSuccess({this.token});

  @override
  List<Object> get props => [token];
}
