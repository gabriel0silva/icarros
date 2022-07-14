import 'dart:convert';

Car carFromJson(String str) => Car.fromJson(json.decode(str));

String carToJson(Car data) => json.encode(data.toJson());

class Car {
    Car({
        required this.price,
        required this.brand,
        required this.model,
        required this.modelYear,
        required this.fuel,
        required this.codeFipe,
        required this.referenceMonth,
        required this.vehicleType,
        required this.fuelAcronym,
    });

    final String price;
    final String brand;
    final String model;
    final int modelYear;
    final String fuel;
    final String codeFipe;
    final String referenceMonth;
    final int vehicleType;
    final String fuelAcronym;

    Car copyWith({
        String? price,
        String? brand,
        String? model,
        int? modelYear,
        String? fuel,
        String? codeFipe,
        String? referenceMonth,
        int? vehicleType,
        String? fuelAcronym,
    }) => 
        Car(
            price: price ?? this.price,
            brand: brand ?? this.brand,
            model: model ?? this.model,
            modelYear: modelYear ?? this.modelYear,
            fuel: fuel ?? this.fuel,
            codeFipe: codeFipe ?? this.codeFipe,
            referenceMonth: referenceMonth ?? this.referenceMonth,
            vehicleType: vehicleType ?? this.vehicleType,
            fuelAcronym: fuelAcronym ?? this.fuelAcronym,
        );

    factory Car.fromJson(Map<String, dynamic> json) => Car(
        price: json["price"],
        brand: json["brand"],
        model: json["model"],
        modelYear: json["modelYear"],
        fuel: json["fuel"],
        codeFipe: json["codeFipe"],
        referenceMonth: json["referenceMonth"],
        vehicleType: json["vehicleType"],
        fuelAcronym: json["fuelAcronym"],
    );

    Map<String, dynamic> toJson() => {
        "price": price,
        "brand": brand,
        "model": model,
        "modelYear": modelYear,
        "fuel": fuel,
        "codeFipe": codeFipe,
        "referenceMonth": referenceMonth,
        "vehicleType": vehicleType,
        "fuelAcronym": fuelAcronym,
    };
}


List<Cars> carsFromJson(String str) => List<Cars>.from(json.decode(str).map((x) => Cars.fromJson(x)));

String carsToJson(List<Cars> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cars {
    Cars({
        required this.name,
        required this.code,
    });

    final String? name;
    final String? code;

    Cars copyWith({
        String? name,
        String? code,
    }) => 
        Cars(
            name: name ?? this.name,
            code: code ?? this.code,
        );

    factory Cars.fromJson(Map<String, dynamic> json) => Cars(
        name: json["name"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
    };
}