import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.format_list_bulleted,
                  color: Colors.blue[600],
                  size: 80,
                ),
                Text(
                  'Catálogo',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 150,
                ),
                Text(
                  'Seja bem vindo!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  width: 250,
                  child: FlatButton(
                    child: Text('Entrar',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onPressed: () {
                      Modular.to.pushNamed('/login');
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(
                      Icons.copyright,
                      size: 15,
                    ),
                    Text(
                      '  Desenvolvido por Gilvan Henrique',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
