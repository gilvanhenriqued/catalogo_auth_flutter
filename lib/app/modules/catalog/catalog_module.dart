import 'repositories/catalog_repository.dart';
import 'catalog_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'catalog_page.dart';

class CatalogModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => CatalogRepository(Dio())),
    Bind((i) => CatalogController()),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => CatalogPage()),
  ];

  static Inject get to => Inject<CatalogModule>.of();
}
