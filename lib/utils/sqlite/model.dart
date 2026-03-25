import 'package:flutter/gestures.dart';

class Usuario{
  int? id;
  String nombre;

  Usuario ({this.id, required this.nombre});

  Map<String, dynamic> toMap(){
    return{
      'id' : id,
      'nombre': nombre,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map){
    return Usuario(
      id: map['id'],
      nombre: map['nombre'],
    );
  }
}