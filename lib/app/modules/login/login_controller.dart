import 'package:catalogo_auth_flutter/app/modules/login/login_repository.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  final LoginRepository repository;

  _LoginControllerBase(this.repository);

  @observable
  String login;

  @observable
  String password;

  @action
  attemptLogin(String login, String password) async {
    var res = await repository.login(login, password);
    return res;
  }

}
