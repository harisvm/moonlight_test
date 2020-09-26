import 'package:moonlight_test/config/server_addresses.dart';
import 'package:moonlight_test/data/models/user_detail_model.dart';
import 'package:moonlight_test/domain/entities/app_exceptions.dart';
import 'package:moonlight_test/domain/entities/rest_api.dart';

class UsersApiProvider {
  ///user detail list  -home screen
  Future<List<UserDetailModel>> getUserDetails({Map<String, dynamic> params}) async {
    try {
      var res = await RestAPI()
          .get('${ServerAddresses.baseUrl}' + ServerAddresses.userList);
      return userDetailModelFromMap(res);
    } on RestException catch (e) {
      throw e.message;
    }
  }
}
