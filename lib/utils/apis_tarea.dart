import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ejercicio1/utils/sqlite/usuario.dart';

class ApiService {
  Future<List<Usuario>> fetchUsuarios(String nombre, String apellido) async {
    final url = 'http://nrweb.com.mx/prueba_ws/api.php?nombre=$nombre&apellido=$apellido';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> usuariosJson = data['usuarios'];
      return usuariosJson.map((json) => Usuario.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar la API');
    }
  }
}