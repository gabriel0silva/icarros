
import 'package:flutter_modular/flutter_modular.dart';
import 'package:icarros/app/modules/home_one/home_page_one.dart';

class HomeModuleOne extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePageOne(brandId: '',))
  ];
}