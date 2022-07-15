import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:icarros/app/modules/result/result_page.dart';
import 'package:icarros/app/widgets/custom_progress_widget.dart';

import '../../controllers/Marcas_controller.dart';
import '../../models/cars_model.dart';

class HomePageTwo extends StatefulWidget {
  final String brandId;
  final String modelId;
  

  const HomePageTwo({ Key? key, required this.brandId, required this.modelId }) : super(key: key);

  @override
  State<HomePageTwo> createState() => _HomePageTwoState();
}

class _HomePageTwoState extends State<HomePageTwo> {

  late List<Cars> ano = [];
  
  void _getAno(String brandId, String modelId) async {
    ano = await CarsController().getAno(brandId, modelId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    brandId = widget.brandId;
    modelId = widget.modelId;
    
    _getAno(brandId, modelId);

  }

  late String brandId;
  late String modelId;
  String? yearId;

   @override
   Widget build(BuildContext context) {
       return Scaffold(
      body: ano.isNotEmpty
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
                        'Selecione o ano',
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
                                          value: yearId, // brandId, modelId ou yearId
                                          onChanged: (String? newValue) {
                                            
                                            setState(() {          
                                              yearId = newValue!;
                                                             
                                            });
                                           Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(brandId: brandId.toString(), modelId: modelId.toString(), yearId: yearId.toString(),)));
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
                                            'Ano...',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                          items: ano.map<DropdownMenuItem<String>>((value) {
                                            return DropdownMenuItem<String>(
                                                value: value.code, // passa a função de mudança de página e faz a chamada da API
                                                child: Text(value.name.toString()));
                                          }).toList(),
                                        )
                            ),
                          )),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 510, right: 300),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF000000)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: const Icon(Icons.arrow_back_rounded)
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