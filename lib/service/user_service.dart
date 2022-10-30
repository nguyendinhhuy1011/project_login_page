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

  Future<User> updateProfile({
    String? name,
    String? date,
    String? address,
    String? email,
    String? avatar,
  }) async {
    final body = {
      "Name": name,
      "DateOfBirth": date,
      "Address": address,
      "Email": email,
      "Avatar": avatar,
    };
    final result = await request(path: '/api/accounts/update',
      body: body,
      method: Method.post,
    );
    final user = User.fromJson(result);
    return user;
  }
  Future<User> getProfile(
      ) async {
    final result = await request(
      path: '/api/accounts/profile',
      method: Method.get,
    );
    final profileUser = User.fromJson(result);

    return profileUser;
  }
  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final body = {
      "OldPassword": oldPassword,
      "NewPassword": newPassword,
    };

    final result = await request(
      path: '/api/accounts/changePassword',
      body: body,
      method: Method.post,
    );

    return true;
  }
}
