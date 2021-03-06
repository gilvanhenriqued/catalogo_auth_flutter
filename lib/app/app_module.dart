import 'package:catalogo_auth_flutter/app/modules/catalog/catalog_module.dart';
import 'package:catalogo_auth_flutter/app/modules/home/home_module.dart';
import 'package:catalogo_auth_flutter/app/modules/login/login_module.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_auth_flutter/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i) => AppController()),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, module: HomeModule()),
    Router('/login', module: LoginModule()),
    Router('/catalog', module: CatalogModule()),
  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
