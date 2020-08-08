import 'package:bloc/bloc.dart';
import 'package:expense/bloc/bloc.dart';
import 'package:expense/model/models.dart';
import 'package:expense/repository/repositories.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, BaseState> {
  ExpenseRepository repository;

  ForgotPasswordBloc({this.repository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(ForgotPasswordEvent event) async* {
    yield LoadingState();
    try {
      final SingleResponse<String> response =
          await repository.forgotPassword(event.email);
      if (response.success) {
        yield SuccessState<String>(data: response.message);
      } else {
        yield ErrorState(message: response.message);
      }
    } catch (_) {
      yield ErrorState(message: "No Connection");
    }
  }
}
