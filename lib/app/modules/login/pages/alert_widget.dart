import 'package:flutter/material.dart';

alert(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('Que pena!'),
      content: Text(msg),
      actions: <Widget>[
        FlatButton(
          child: Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          },
        )        
      ],
    ),
  );
}
