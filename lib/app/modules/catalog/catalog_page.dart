import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'catalog_controller.dart';

class CatalogPage extends StatefulWidget {
  final String title;
  const CatalogPage({Key key, this.title = "Catálogo"}) : super(key: key);

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
    return Center(
      child: Text(
        "Lista de Produtos",
        style: TextStyle(fontSize: 20),
      )
    );
  }

}
