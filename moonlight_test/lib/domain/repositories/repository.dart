import 'package:moonlight_test/data/data_sources/api_provider.dart';
import 'package:moonlight_test/data/models/user_detail_model.dart';

class Repository {
  UsersApiProvider usersApiProvider = UsersApiProvider();
//  MerchantApiProvider merchantApiProvider = MerchantApiProvider();
//
//  ///start screen -sign in, sign up, forgotPassword
//
  Future<List<UserDetailModel>> getUserDetails({Map<String, dynamic> params}) =>
      usersApiProvider.getUserDetails();
}