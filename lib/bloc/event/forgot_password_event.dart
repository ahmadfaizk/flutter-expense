import 'package:expense/bloc/bloc.dart';

class ForgotPasswordEvent extends BaseEvent {
  final String email;
  const ForgotPasswordEvent({this.email});

  @override
  List<Object> get props => [email];
}
