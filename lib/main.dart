import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:icarros/firebase_options.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));

  
}



/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Icarros',
       initialRoute: 
        '/', 
        routes: {
          '/' : (_) => const SplashPage(),
          '/login' : (_) => LoginPage(),
          '/home' : (_) => HomePage()
          

        }
    );
  }
}
*/
