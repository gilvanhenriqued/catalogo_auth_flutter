import 'login_repository.dart';
import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => LoginRepository()),
    Bind((i) => LoginController(i.get<LoginRepository>())),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => LoginPage()),
  ];

  static Inject get to => Inject<LoginModule>.of();
}
