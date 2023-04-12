import '../helper/api.dart';
import '../models/User.dart';

class LoginUser {
  static Future<User> LoginMyUser(
      {required String email,
      required String password,}) async {
    Map<String, dynamic> data = await 
        Api().post(url:'https://technichal.prominaagency.com/api/auth/login',
          body: {
      'email': email,
      'password': password,
    },
        );
    return User.fromJson(data);
  }
}
