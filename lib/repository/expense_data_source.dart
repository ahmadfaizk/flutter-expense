import 'package:expense/model/models.dart';

abstract class ExpenseDataSource {
  Future<SingleResponse<Token>> login(String email, String password);
}
