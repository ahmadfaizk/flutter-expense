import 'package:expense/model/models.dart';

abstract class ExpenseDataSource {
  Future<SingleResponse<Token>> login(String email, String password);
  Future<SingleResponse<String>> forgotPassword(String email);
  Future<SingleResponse<String>> verifyOtp(String email, String otp);
  Future<SingleResponse<String>> resetPassword(
      String email, String otp, String password);
}
