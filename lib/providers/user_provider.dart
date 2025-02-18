import 'dart:convert';

import 'package:distcanal_io/models/user_model.dart';
import 'package:distcanal_io/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  final String hostName = '10.0.2.2:8080';
  //final String hostName = '197.149.231.141:8090';
  User? user;
  late AuthProvider authProvider;

  update(AuthProvider newAuthProvider) {
    authProvider = newAuthProvider;
    if (user == null && authProvider.isLogged) {
      fetchCurrentUser();
    }
  }

  Future<void> fetchCurrentUser() async {
    try {
      http.Response response = await http.get(
          Uri.http(hostName, '/auth/getCurrentUser'),
          headers: {'authorization': 'Bearer ${authProvider.token}'});

      final Map<String, dynamic> body = json.decode(response.body);
      if (response.statusCode == 200) {
        final User user = User.fromJson(body['data']['user']);
        updateUser(user);
      }
    } catch (e) {
      rethrow;
    }
  }

  void updateUser(User updatedUser) {
    user = updatedUser;
    notifyListeners();
  }
}
