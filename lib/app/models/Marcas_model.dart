class Marcas {
  String? nome;
  String? codigo;

  Marcas({this.nome, this.codigo});

  Marcas.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    codigo = json['codigo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['codigo'] = codigo;
    return data;
  }
  }