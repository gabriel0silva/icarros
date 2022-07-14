
class Marcas {
  String? nome;
  String? codigo;

  Marcas({this.nome, this.codigo});

  Marcas.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    codigo = json['codigo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['codigo'] = this.codigo;
    return data;
  }
  }