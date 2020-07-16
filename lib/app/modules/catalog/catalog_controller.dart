import 'package:mobx/mobx.dart';

part 'catalog_controller.g.dart';

class CatalogController = _CatalogControllerBase with _$CatalogController;

abstract class _CatalogControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
