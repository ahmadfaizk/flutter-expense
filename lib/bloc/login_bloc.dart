import 'package:bloc/bloc.dart';
import 'package:expense/bloc/login_event.dart';
import 'package:expense/bloc/login_state.dart';
import 'package:expense/data/expense_repository.dart';
import 'package:expense/model/models.dart';

class LoginBlock extends Bloc<LoginEvent, LoginState> {
  ExpenseRepository repository;

  LoginBlock({this.repository}) : super(null);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is FetchLogin) {
      yield LoginLoading();
    }
    try {
      final SingleResponse<Token> response = await repository.login(
          (event as FetchLogin).email, (event as FetchLogin).password);
      if (response.success) {
        yield LoginSuccess(token: response.data);
      } else {
        yield LoginError(message: response.message);
      }
    } catch (_) {
      yield LoginError(message: "No Connection");
    }
  }
}
