import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {

  final _ctrlLogin = TextEditingController();
  final _ctrlPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context){
    return Observer(
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(25),
            child: ListView(
              children: <Widget>[
                _textFormField(
                  "Login",
                  "Digite seu nome de usuário",
                  textController: _ctrlLogin,
                  validator: _validateLogin,
                ),
                _textFormField(
                  "Senha",
                  "Digite sua senha",
                  isPassword: true,
                  textController: _ctrlPassword,
                  validator: _validatePassword,
                ),
                SizedBox(height: 30),
                _raisedButton("Entrar", Colors.blue, context),
              ],
            ),
          ),
        );
      }
    );
  }

  _textFormField(
    String label, 
    String hint, {
      bool isPassword = false, 
      TextEditingController textController, 
      FormFieldValidator<String> validator 
    }) {
    
    return TextFormField(
      controller: textController,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }

  String _validateLogin(String text) {
    if(text.isEmpty){
      return "Informe o login!";
    }

    if(text.length < 3) {
      return "O usuário precisa ser maior do que 3 caracteres...";
    }

    return null;
  }

  String _validatePassword(String text) {
    if(text.isEmpty){
      return "Informe o senha!";
    }

    if(text.length < 3) {
      return "A senha precisa ser maior do que 3 caracteres...";
    }

    return null;
  }

  _raisedButton(String text, Color color, BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(10),
      color: color,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
      ),
      onPressed: () {
        _clickButton(context);
      },
    );
  }

  _clickButton(BuildContext context) {
    bool isFormValidated = _formKey.currentState.validate();

    if(!isFormValidated) {
      return ;
    }

    String login = _ctrlLogin.text;
    String password = _ctrlPassword.text;

    print("login: $login ||| senha: $password");

    _navigateToCatalog();
  }

  _navigateToCatalog() {
    Modular.to.pushNamed('/catalog');
  }

}
