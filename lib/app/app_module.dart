import 'package:flutter_modular/flutter_modular.dart';
import 'package:icarros/app/modules/home/home_module.dart';
import 'package:icarros/app/modules/home_one/home_one_module.dart';
import 'package:icarros/app/modules/login/login_module.dart';
import 'package:icarros/app/modules/result/result.module.dart';
import 'package:icarros/app/services/auth/auth_service.dart';
import 'package:icarros/app/services/auth/auth_service_impl.dart';

import 'modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton<AuthService>((i) => AuthServiceImpl()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const SplashPage()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/home1', module: HomeModuleOne()),
    ModuleRoute('/result', module: ResultModule())
    
  ];
}