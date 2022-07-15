import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:icarros/app/controllers/Marcas_controller.dart';
import 'package:icarros/app/models/cars_model.dart';
import 'package:icarros/app/modules/home_one/home_page_one.dart';

import 'package:icarros/app/widgets/custom_progress_widget.dart';


import '../../services/auth/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Cars> marcas = [];

  void _getMarcas() async {
    marcas = await CarsController().getBrands();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getMarcas();
  }

  String? brandId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: marcas.isNotEmpty
        ? Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .85,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    )),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 39,
                        bottom: 12,
                      ),
                      child: Text(
                        'Primeiro selecione uma marca',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    // DropdownButton(items: list.map((item)), )

                     SizedBox(
                      height: 60,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 60, left: 60),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 1),
                                  borderRadius:
                                      BorderRadius.circular(30)),
                                        
                                        child: DropdownButton(
                                          value: brandId, // brandId, modelId ou yearId
                                          onChanged: (String? newValue) {
                                            
                                            setState(() {          
                                              brandId = newValue!;
                                                             
                                            });
                                           Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageOne(brandId: brandId.toString())));
                                          },

                                          dropdownColor: Colors.white,
                                          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                                          iconSize: 36,
                                          isExpanded: true,
                                          underline: const SizedBox(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                          hint: const Text(
                                            'Marcas...',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                          items: marcas.map<DropdownMenuItem<String>>((value) {
                                            return DropdownMenuItem<String>(
                                                value: value.code, // passa a função de mudança de página e faz a chamada da API
                                                child: Text(value.name.toString()));
                                          }).toList(),
                                        )
                                        
                                        
                            ),
                          )),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 510, left: 280),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF000000)),
                        onPressed: () {
                          
                          Modular.get<AuthService>().signOut();
                            
                           
                        },
                        child: const Text(
                          'Sair',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      )
      : const CustomProgressWidget()
    );
  }
}



/*
return Scaffold(

           body: Center(
             child: Container(
                
               child: Expanded(
                 child: ListView.builder(
                   scrollDirection: Axis.vertical,
                   itemCount: list.length,
                   itemBuilder: (BuildContext ctxt, int index) {
                     return Text(list[index].nome.toString());
                   },
                 ),
             ),
             )
           )
       );
 */

/*

ValueListenableBuilder(valueListenable: dropValue, builder: (BuildContext context, String value, _) {
                      return DropdownButtonFormField<String>(
                        hint: const Text('Escolha a marca'),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.purple,
                                width: 2.0,
                              ),
                            ),
                          ),
                        value: (value.isEmpty) ? null : value,
                        onChanged: (escolha) => Navigator.pushNamed(context, '/'),
                        items: dropOpcoes
                          .map((op) => DropdownMenuItem(
                            value: op,
                            child: Text(op)
                          )).toList()
                      );
                    }),
 */