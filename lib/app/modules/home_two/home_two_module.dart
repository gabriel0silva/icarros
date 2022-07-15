
import 'package:flutter_modular/flutter_modular.dart';
import 'package:icarros/app/modules/home/home_page.dart';
import 'package:icarros/app/modules/result/result_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const ResultPage(brandId: '', yearId: '', modelId: '',))
  ];
}