import 'package:catalogo_auth_flutter/app/modules/login/login_repository.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  final LoginRepository repository;

  _LoginControllerBase(this.repository);

  @observable
  String username;

  @observable
  String password;

  @action
  attemptLogin(String username, String password) async {
    var response = await repository.attemptLoginAPI(username, password);
    return response;
  }

}
