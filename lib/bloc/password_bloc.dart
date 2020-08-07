import 'package:bloc/bloc.dart';
import 'package:expense/bloc/bloc.dart';
import 'package:expense/bloc/password_event.dart';

class PasswordBloc extends Bloc<BaseEvent, BaseState> {
  PasswordBloc() : super(SuccessState<bool>(data: true));

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is PasswordEvent) {
      yield SuccessState<bool>(data: event.visibility);
    } else {
      yield ErrorState(message: "State not found");
    }
  }
}
