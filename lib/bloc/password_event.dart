import 'package:expense/bloc/base_event.dart';

class PasswordEvent extends BaseEvent {
  final bool visibility;
  PasswordEvent({this.visibility});
  @override
  List<Object> get props => [visibility];
}
