import 'package:flex_color_scheme/flex_color_scheme.dart';

class Usuario {
  int? id;
  String nombre;
  String apPaterno;
  String apMaterno;
  int edad;
  int bandera;

  Usuario({
    this.id,
    required this.nombre,
    required this.apPaterno,
    required this.apMaterno,
    required this.edad,
    required this.bandera,
  });

  factory Usuario.fromJson(Map<String, dynamic> json){
    return Usuario(
      nombre: json['nombre'],
      apPaterno: json['ap_paterno'],
      apMaterno: json['ap_materno'],
      edad: json['edad'],
      bandera: json['bandera'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'ap_paterno': apPaterno,
      'ap_materno': apMaterno,
      'edad': edad,
      'bandera': bandera,
    };
  }
}