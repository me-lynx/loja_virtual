import 'dart:convert';

class Address {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? uf;
  String? cidade;

  Address(
      {this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.uf,
      this.cidade});

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));
  factory Address.fromMap(Map<String, dynamic> json) => Address(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        uf: json["uf"],
        cidade: json["localidade"],
      );
}
