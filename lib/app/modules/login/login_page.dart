import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icarros/app/modules/login/controller/login_controller.dart';
import 'package:icarros/app/styles/i_carros_icons.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;

  const LoginPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screnSize = MediaQuery.of(context).size;

    return BlocListener<LoginController, LoginState>(
      bloc: controller,
      listenWhen: ((previous, current) => previous.status != current.status),
      listener: (context, state) {
        if (state.status == LoginStatus.failure) {
          final message = state.errorMessage ?? 'Erro ao realizar login';
          AsukaSnackbar.alert(message).show();
        }
      },
      child: Scaffold(
        body: Stack(
          //child: incluiStack(),
          children: <Widget>[
            Image.asset(
              'assets/images/img_principal.png',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 329,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      )),
                  child: Column(children:  [
                    Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: Container(
                        height: 3,
                        width: 110,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          )
                        ),
                      ),
                    ),
                    const Padding(
                      padding:  EdgeInsets.only(
                      top: 59,
                      bottom: 59,
                    ),
                      child: Text(
                        'iCarros',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Text(
                      'Entre com a sua com sua conta google',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: controller.inLoader,
                      builder: (_, inLoader, __) => inLoader
                          ? const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.black,
                                color: Colors.white,
                              ),
                            )
                          : SizedBox(
                              width: screnSize.width * .8,
                              height: 52,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  controller.SignIn();
                                },
                                label: const Text('Entrar'),
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF000000),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                icon: const Icon(ICarrosIcons.google),
                              ),
                            ),
                    ),
                  ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


