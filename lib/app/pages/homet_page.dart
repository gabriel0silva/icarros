import 'package:flutter/material.dart';
import 'package:icarros/app/styles/i_carros_icons.dart';

class HometPage extends StatefulWidget {
  const HometPage({Key? key}) : super(key: key);

 

  @override
  State<HometPage> createState() => _HometPageState();
}

class _HometPageState extends State<HometPage> {

  
  @override
  Widget build(BuildContext context) {
    final screnSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/img_principal.png'),
          Container(
            padding: const EdgeInsets.only(
              top: 90,
              bottom: 90,
            ),
            child: const Text(
              'iCarrros',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Text(
            'Entre com a sua com sua conta google',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          Container(
            child: SizedBox(
              width: screnSize.width * .8,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {},
                label: const Text('Entrar'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF000000),
                ),
                icon: const Icon(ICarrosIcons.google),
              ),
            ),
          )
        ],
      ),
    );
  }
}
