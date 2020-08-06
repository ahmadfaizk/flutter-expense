import 'package:expense/model/single_response.dart';
import 'package:expense/model/token.dart';

abstract class ExpenseDataSource {
  Future<SingleResponse<Token>> login(String email, String password);
}
