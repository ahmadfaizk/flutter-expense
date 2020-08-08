import 'package:bloc/bloc.dart';

class PasswordBloc extends Bloc<bool, bool> {
  PasswordBloc() : super(true);

  @override
  Stream<bool> mapEventToState(bool event) async* {
    yield event;
  }
}
