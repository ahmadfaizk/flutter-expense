import 'package:expense/data/expense_data_source.dart';
import 'package:expense/data/remote/remote_data_source.dart';
import 'package:expense/model/token.dart';
import 'package:expense/model/single_response.dart';

class ExpenseRepository implements ExpenseDataSource {
  RemoteDataSource remoteDataSource;
  ExpenseRepository({this.remoteDataSource});
  @override
  Future<SingleResponse<Token>> login(String email, String password) async {
    var response = await remoteDataSource.login(email, password);
    return response;
  }
}
