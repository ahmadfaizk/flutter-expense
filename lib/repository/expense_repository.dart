import 'package:expense/model/models.dart';
import 'package:expense/repository/repositories.dart';

class ExpenseRepository implements ExpenseDataSource {
  RemoteDataSource remoteDataSource;
  ExpenseRepository({this.remoteDataSource});

  @override
  Future<SingleResponse<Token>> login(String email, String password) async {
    return await remoteDataSource.login(email, password);
  }

  @override
  Future<SingleResponse<String>> forgotPassword(String email) async {
    return await remoteDataSource.forgotPassword(email);
  }

  @override
  Future<SingleResponse<String>> resetPassword(
      String email, String otp, String password) async {
    return await remoteDataSource.resetPassword(email, otp, password);
  }

  @override
  Future<SingleResponse<String>> verifyOtp(String email, String otp) async {
    return await remoteDataSource.verifyOtp(email, otp);
  }
}
