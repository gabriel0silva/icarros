import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:icarros/app/services/auth/auth_service.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';



class SplashPage extends StatefulWidget {

  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

@override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future.delayed(const Duration(seconds: 3))
        .then((_) => Modular.to.navigate('/login'));
      } else {
        Future.delayed(const Duration(seconds: 3))
        .then((_) => Modular.to.navigate('/home'));
      }
      }); 
  }

/*
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4))
      .then((_) => FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed('/login');
      } else {
        Navigator.of(context).pushReplacementNamed('/home');
      }
      })); 
  }
  */

   @override
   Widget build(BuildContext context) {
       return Scaffold(
          body: Container(alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: Lottie.asset("assets/lottie/car.json")
                )
              ],
            ),
          )
       );
  }
}