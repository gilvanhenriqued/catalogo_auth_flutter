import 'repositories/catalog_repository.dart';
import 'catalog_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'catalog_page.dart';

class CatalogModule extends ChildModule {

  @override
  List<Bind> get binds => [
    Bind((i) => CatalogRepository()),
    Bind((i) => CatalogController(i.get<CatalogRepository>())),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => CatalogPage(user: args.data)),
  ];

  static Inject get to => Inject<CatalogModule>.of();
}
