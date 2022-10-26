import 'package:homework2/service/api_service.dart';

import '../models/User.dart';

extension UserService on APIService {
  Future<User> login({
    required String phone,
    required String password,
  }) async {
    final body = {
      "PhoneNumber": phone,
      "Password": password,
    };

    final result = await request(
      path: '/api/accounts/login',
      body: body,
      method: Method.post,
    );

    final user = User.fromJson(result);
    return user;
  }

  Future<User> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    final body = {
      "Name": name,
      "PhoneNumber": phone,
      "Email": email,
      "Password": password,
    };

    final result = await request(
      path: '/api/accounts/register',
      body: body,
      method: Method.post,
    );

    final user = User.fromJson(result);
    return user;
  }

}
