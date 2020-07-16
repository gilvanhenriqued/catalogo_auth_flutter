import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRepository {

  var urlBaseLogin = 'https://www.macoratti.net.br/catalogo/api/contas/login';
  
  // Request to login
  Future<String> login(String user, String password) async {

    var headerRequest = {"Content-Type": "application/json"};

    Map bodyRequest = {
      "username": user,
      "senha": password,
      "email": user
    };

    var _bodyJson = json.encode(bodyRequest);

    var response = await http.post(
      urlBaseLogin, 
      headers: headerRequest, 
      body: _bodyJson
    );
  
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = json.decode(response.body);

    String token = mapResponse["token"];

    print('Token: $token');

    return response.statusCode.toString();

  }

}
