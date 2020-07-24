import 'dart:convert';
import 'package:catalogo_auth_flutter/app/models/user.dart';
import 'package:http/http.dart' as http;

class LoginRepository {

  var urlBaseLogin = 'https://www.macoratti.net.br/catalogo/api/contas/login';
  
  // Request to login
  Future<User> attemptLoginAPI(String username, String password) async {

    var headerRequest = {"Content-Type": "application/json"};

    Map bodyRequest = {
      "username": username,
      "senha": password,
      "email": username
    };

    var _bodyJson = json.encode(bodyRequest);

    var response = await http.post(
      urlBaseLogin, 
      headers: headerRequest, 
      body: _bodyJson
    );
  
    print('Response status: ${response.statusCode}');

    Map mapResponse = json.decode(response.body);

    final user = User.fromJson(mapResponse);

    return user;

  }

}
