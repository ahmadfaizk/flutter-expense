import 'package:expense/model/models.dart';
import 'package:expense/repository/repositories.dart';

class ExpenseRepository implements ExpenseDataSource {
  RemoteDataSource remoteDataSource;
  ExpenseRepository({this.remoteDataSource});
  @override
  Future<SingleResponse<Token>> login(String email, String password) async {
    var response = await remoteDataSource.login(email, password);
    return response;
  }
}
