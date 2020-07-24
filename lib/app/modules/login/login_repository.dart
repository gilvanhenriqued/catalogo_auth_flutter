import 'dart:convert';
import 'package:catalogo_auth_flutter/app/models/user.dart';
import 'package:http/http.dart' as http;

class LoginRepository {

  final String urlBaseLogin = 'https://www.macoratti.net.br/catalogo/api/contas/login';
  
  // Request to login
  Future<User> attemptLoginAPI(String username, String password) async {
    // GET request
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

    User user;
  
    // handling and sending datas to UI
    print('Response status: ${response.statusCode}');

    var mapResponse = json.decode(response.body);

    if(response.statusCode == 200) {
      user = User.fromJson(mapResponse);
      return user;
    } else {
      return user;
    }
    
  }

}
