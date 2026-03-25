import 'package:ejercicio1/utils/sqlite/db.dart';
import 'package:ejercicio1/utils/sqlite/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  final DBHelper dbHelper = DBHelper();
  final controller = TextEditingController();

  List<Usuario> usuarios = [];
  Usuario? usuarioCU;

  Future<void> guardar() async {
    if (controller.text.isEmpty) return;

    if (usuarioCU == null){
      await dbHelper.insertUsuario(
        Usuario(nombre: controller.text),
      );
    }else{
      usuarioCU!.nombre = controller.text;
    }

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Nombre'),
            ),
            ElevatedButton(
              onPressed: () => guardar(),
              child: Text('GUARDAR'))
          ],
        ),
      ),
    );
  }
}
