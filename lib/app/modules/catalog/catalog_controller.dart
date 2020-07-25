import 'package:catalogo_auth_flutter/app/models/user.dart';
import 'package:mobx/mobx.dart';

part 'catalog_controller.g.dart';

class CatalogController = _CatalogControllerBase with _$CatalogController;

abstract class _CatalogControllerBase with Store {
  @observable
  User user;
  
}
