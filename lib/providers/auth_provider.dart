import 'dart:async';
import 'dart:convert';

import 'package:distcanal_io/models/signin_model.dart';
import 'package:distcanal_io/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  final String hostName = '10.0.2.2:8080';
  bool isLoading = false;

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  late String token;
  late String refreshToken;
  late bool isLogged = false;
  Timer? _timer;

  Future<void> initAuth() async {
    try {
      String? oldToken = await storage.read(key: 'token');

      if (oldToken == null) {
        isLogged = false;
      } else {
        token = oldToken;
        await refresToken();
        isLogged = true;
        notifyListeners();
        _initTimer();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresToken() async {
    try {
      String? refreshToken = await storage.read(key: 'refreshToken');
      http.Response response = await http.get(
        Uri.http(hostName, '/auth/refresh-token'),
        headers: {'authorization': 'Bearer $refreshToken'},
      );

      final Map<String, dynamic> body = json.decode(response.body);

      if (response.statusCode == 200) {
        final User user = User.fromJson(body['user']);

        /// Get user by usernameOrEmail
        token = body['accessToken'];

        ///Sauvegarder le token
        storage.write(key: 'refreshToken', value: token);
        storage.write(key: 'username', value: user.nomDist);
      } else {
        signout();
      }
    } catch (e) {
      rethrow;
    }
  }

  ///  Connexion
  Future<dynamic> signin(SigninForm signinForm) async {
    try {
      http.Response response = await http.post(
        Uri.http(hostName, '/auth/login'),
        headers: {'Content-type': 'application/json'},
        body: json.encode(signinForm.toJson()),
      );

      /// je recupere la reponse du serveur
      final Map<String, dynamic> body = json.decode(response.body);

      if (response.statusCode == 200) {
        final User user = User.fromJson(body['data']['user']);

        print(user.firstName);

        token = body['data']['access_token'];
        refreshToken = body['data']['refresh_token'];

        ///Sauvegarder le token
        storage.write(key: 'token', value: token);
        storage.write(key: 'refreshToken', value: refreshToken);
        storage.write(key: 'idUser', value: '${body['data']['user']['id']}');
        isLogged = true;
        _initTimer();

        return user;
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Forer à rafraichir le token apres chaque 10 minutes
  void _initTimer() {
    _timer = Timer.periodic(const Duration(minutes: 10), (timer) {
      refresToken();
    });
  }

  void signout() async {
    isLogged = false;
    token = '';
    await storage.delete(key: 'token');
    _cancelTimer();
    notifyListeners();
  }

  void _cancelTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }
}
