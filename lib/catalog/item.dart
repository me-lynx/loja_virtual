import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  Item({ required this.id, required this.name, required this.price, required this.isFavorite, required this.image, this.color});

  final String id;
  final String name;
  final String? color;
  final String? price;
  bool isFavorite = false;
  String image;



factory Item.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> firebaseData){
  return Item(
    id: firebaseData?["id"],
    name: firebaseData?["name"],
    color: firebaseData?["color"],
    price: firebaseData?["price"],
    isFavorite: firebaseData?["isFavorite"],
    image: firebaseData?["image"],
  );
}

  factory Item.fromFirebase(Map<String, dynamic> firebaseData) {
    return Item(
        id: firebaseData?["id"],
        name: firebaseData?["name"],
        color: firebaseData?["color"],
        price: firebaseData?["price"],
        isFavorite: firebaseData?["isFavorite"],
        image: firebaseData?["image"],
    );
  }


  Map<String,dynamic>toFirestore(){
    return {
      if(id != null) "id": id,
      if(name != null) "name": name,
      if(color != null) "color": color,
      if(price != null) "price": price,
      if(isFavorite != null) "isFavorite": isFavorite,
      if(image != null) "image": image,
    };
  }


  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["nome"],
    color: json["color"],
    image: json["imagem"],
    isFavorite: json["isfavorite"],
    price: json["preco"],
  );

}
