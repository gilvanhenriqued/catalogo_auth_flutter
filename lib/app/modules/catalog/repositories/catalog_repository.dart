import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:catalogo_auth_flutter/app/models/product.dart';

class CatalogRepository {

  final String urlBaseProducts = 'https://www.macoratti.net.br/catalogo/api/produtos/v2/todos';

  // GET products
  Future<List<Product>> getAllProducts() async {
    final products = List<Product>();

    var response = await http.get(urlBaseProducts);

    var mapResponse = json.decode(response.body);


    if(response.statusCode == 200) {
      mapResponse.forEach((item) => products.add(Product.fromJson(item)));
      return products;
    } else {
      print('erro no carregamento da lista' + response.statusCode.toString());
      return null;
    }

  }

}
