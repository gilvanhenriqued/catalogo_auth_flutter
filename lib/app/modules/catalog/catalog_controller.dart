import 'package:catalogo_auth_flutter/app/models/product.dart';
import 'package:catalogo_auth_flutter/app/models/user.dart';
import 'package:catalogo_auth_flutter/app/modules/catalog/repositories/catalog_repository.dart';
import 'package:mobx/mobx.dart';

part 'catalog_controller.g.dart';

class CatalogController = _CatalogControllerBase with _$CatalogController;

abstract class _CatalogControllerBase with Store {
  @observable
  User user;

  final CatalogRepository repository;

  _CatalogControllerBase(this.repository){
    loadProducts();
  }

  @observable
  ObservableList<Product> productList;

  @action 
  loadProducts() async {
    productList = ObservableList<Product>.of(await repository.getAllProducts());
  }

  
}
