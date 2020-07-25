import 'package:catalogo_auth_flutter/app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'catalog_controller.dart';

class CatalogPage extends StatefulWidget {
  final String title;
  final User user;

  const CatalogPage({Key key, this.title = "Catálogo", this.user}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends ModularState<CatalogPage, CatalogController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
    );
  }

  _body(){
    return Observer(
      builder: (_) {
        final catalogController = Modular.get<CatalogController>();
        catalogController.user = widget.user;

        return Center(
          child: Text(
            "Lista de Produtos de ${catalogController.user}",
            style: TextStyle(fontSize: 20),
          )
        ); 
      }
    );
  }

}
