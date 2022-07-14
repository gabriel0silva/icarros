import 'package:flutter_modular/flutter_modular.dart';
import 'package:icarros/app/modules/result/result_page.dart';

class ResultModule extends Module {
 @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => ResultPage(brandId: '', modelId: '', yearId: '',))
  ];

  
}