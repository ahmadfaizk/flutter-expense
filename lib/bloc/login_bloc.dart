import 'package:bloc/bloc.dart';
import 'package:expense/bloc/bloc.dart';
import 'package:expense/model/models.dart';
import 'package:expense/repository/repositories.dart';

class LoginBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository repository;

  LoginBloc({this.repository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is LoginEvent) {
      yield LoadingState();
      try {
        final SingleResponse<Token> response =
            await repository.login(event.email, event.password);
        if (response.success) {
          yield SuccessState<Token>(data: response.data);
        } else {
          yield ErrorState(message: response.message);
        }
      } catch (_) {
        yield ErrorState(message: "No Connection");
      }
    } else if (event is LogoutEvent) {
      yield EmptyState();
    } else {
      yield ErrorState(message: "Event Not Match");
    }
  }
}
