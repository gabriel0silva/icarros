import 'package:flutter/material.dart';
import 'package:icarros/app/styles/i_carros_icons.dart';
import 'package:icarros/app/widgets/listTile_widget.dart';

import '../../controllers/Marcas_controller.dart';
import '../../models/cars_model.dart';

import 'package:url_launcher/url_launcher.dart';

class ResultPage extends StatefulWidget {
  final String brandId;
  final String modelId;
  final String yearId;

  ResultPage(
      {Key? key,
      required this.brandId,
      required this.modelId,
      required this.yearId})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Car? car;

  void _getComp(String brandId, String modelId, String yearId) async {
    car = await CarsController().getComp(brandId, modelId, yearId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    brandId = widget.brandId;
    modelId = widget.modelId;
    yearId = widget.yearId;

    _getComp(brandId, modelId, yearId);
  }

  late String brandId;
  late String modelId;
  late String yearId;

  

  @override
  Widget build(BuildContext context) {
    final screnSize = MediaQuery.of(context).size;

    return Scaffold(
        body: car != null
            ? Stack(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        height: screnSize.height * .40,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15, 17, 15, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  
                                  icon: const Icon(
                                    Icons.arrow_back_rounded,
                                    size: 32,
                                    color: Colors.white,
                                  )),
                              Text(
                                car!.model,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 43,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      
                                      icon: const Icon(
                                        ICarrosIcons.heart_empty,
                                        size: 32,
                                        color: Colors.white
                                      )),
                                  const Text(
                                    '|',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextButton.icon(
                                    onPressed: () async {
                                      final Uri url = Uri.parse('https://sp.olx.com.br/?q=${car!.model}');  
                                      // String url = 'https://www.google.com/search?q=${car!.model}';
                                      // await launch(url, forceWebView: false);
                                      await launchUrl(url);
                                    },
                                    icon: const Icon(
                                      ICarrosIcons.export_icon,
                                      size: 32,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      'Ver Ofertas',
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.white
                                      ),
                                    ),
                                    
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // {"Valor":"R$ 127.451,00","Marca":"VW - VolksWagen","Modelo":"AMAROK High.CD 2.0 16V TDI 4x4 Dies. Aut","AnoModelo":2014,"Combustivel":"Diesel","CodigoFipe":"005340-6","MesReferencia":"julho de 2022 ","TipoVeiculo":1,"SiglaCombustivel":"D"}
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Column(
                          children: [
                            Column(children: [
                              ListTileWidget(
                                title: 'Marca',
                                subtitle: car!.brand,
                              ),
                              ListTileWidget(
                                title: 'Valor',
                                subtitle: car!.price,
                              ),
                              ListTileWidget(
                                title: 'Código FIPE',
                                subtitle: car!.codeFipe,
                              ),
                              ListTileWidget(
                                title: 'Combustível',
                                subtitle: car!.fuel,
                              ),
                              ListTileWidget(
                                title: 'Ano',
                                subtitle: car!.modelYear.toString(),
                              )
                            ])
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screnSize.width * .8,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF000000),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text(
                            'Fazer outra consulta',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text('Deixe uma susgestão'),
                    ],
                  )
                ],
              )
            : CircularProgressIndicator());

            
  }
  
  
}


