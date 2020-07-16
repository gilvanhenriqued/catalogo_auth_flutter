import 'package:catalogo_auth_flutter/app/modules/catalog/catalog_module.dart';

import 'login_repository.dart';
import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => LoginRepository(Dio())),
    Bind((i) => LoginController()),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => LoginPage()),
    Router('/catalog', module: CatalogModule()),
  ];

  static Inject get to => Inject<LoginModule>.of();
}
