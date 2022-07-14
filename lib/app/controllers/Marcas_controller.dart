// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:icarros/app/models/cars_model.dart';


class CarsController {
 ValueNotifier<List<Cars>?> cars =  ValueNotifier<List<Cars>?>([]);
 ValueNotifier<Car?> car =  ValueNotifier<Car?>(null);

  var client = http.Client();

  // 'https://parallelum.com.br/fipe/api/v1/carros/cars/$ncars/modelos/$nmodelos/anos/$anos'


  var url = 'https://parallelum.com.br/fipe/api/v2/cars';
  Future<List<Cars>> getBrands() async {
    var response = await client.get(Uri.parse('$url/brands'));
    var decodedResponse = jsonDecode(response.body) as List; 
    return cars.value = decodedResponse.map((e) => Cars.fromJson(e)).toList();
  }

  Future<List<Cars>> getModelos(String brandId) async {
    var response = await client.get(Uri.parse('$url/brands/$brandId/models'));
    var decodedResponse = jsonDecode(response.body) as List; 
    return cars.value = decodedResponse.map((e) => Cars.fromJson(e)).toList();
  }

  Future<List<Cars>> getAno(String brandId, String modelId) async {
    var response = await client.get(Uri.parse('$url/brands/$brandId/models/$modelId/years'));
    var decodedResponse = jsonDecode(response.body) as List; 
    return cars.value = decodedResponse.map((e) => Cars.fromJson(e)).toList();
  }

  Future<Car> getComp(String brandId, String modelId, String yearId) async {
    var response = await client.get((Uri.parse('$url/brands/$brandId/models/$modelId/years/$yearId')));
    var decodedResponse = jsonDecode(response.body); 
    return car.value = Car.fromJson(decodedResponse);
  }


  
}
