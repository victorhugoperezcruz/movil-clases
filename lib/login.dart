import 'dart:ui';
import 'package:ejercicio1/utils/constantes.dart' as con;
import 'package:ejercicio1/home.dart';
import 'package:ejercicio1/utils/singleton.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showpwd = true;

  final user = TextEditingController();
  final pwd = TextEditingController();

  Singleton singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView( //Scroll
        padding: EdgeInsets.all(75.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundColor: con.color1,
              child: Icon(
                Icons.gamepad_outlined,
                color: Colors.white,
                size: 50.0,
              ), // Icon
            ), // CircleAvatar
            SizedBox(height: size.height * 0.1),
            NewWidgetLabelText(texto: "Usuario:",),
            buildTextFormFieldLogin("Escribe tu usuario", false, user),
            SizedBox(height: size.height * 0.075),
            NewWidgetLabelText(texto: "Contraseña:",),
            buildTextFormFieldLogin("Escribe tu contraseña", true, pwd),
            SizedBox(height: size.height * 0.1),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  //comparar el texto de los textform y las constantes
                  print(user.text);
                  print(pwd.text);
                  if (user.text == con.user && pwd.text == con.pwd) {
                    singleton.nameUser = con.name;
                    singleton.lastNameUser = con.lastname;
                    singleton.wallet = con.wallet;
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => Home())); // MaterialPageRoute
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff24735b),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ), // RoundedRectangleBorder
                  fixedSize: Size(size.width * 0.6, 45)
              ),
              child: Text(
                'INGRESAR',
                style: TextStyle(
                    color: Color(0xffeaf6f2),
                    fontSize: 17,
                    fontWeight: FontWeight.w700
                ), // TextStyle
              ), // Text
            ) // ElevatedButton
          ],
        ), // Column
      ), // SingleChildScrollView
    ); // Scaffold
  }

  //clic derecho -> Refactor -> Extract Method
  TextFormField buildTextFormFieldLogin(
      String hintText, bool band, control) {
    return TextFormField(
      controller: control,
      obscureText: band ? showpwd : band, //oculta o muestra el texto
      decoration: InputDecoration(
        suffixIcon: band ? IconButton(
          onPressed: () {
            setState(() {
              showpwd = showpwd ? false : true;
            });
          },
          icon: Icon(
            showpwd ? Icons.visibility : Icons.visibility_off,
            color: Color(0xff24735b),
          ), // Icon
        ) : Icon(Icons.add, color: Colors.transparent,), // IconButton
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 1, style: BorderStyle.none,
          ), // BorderSide
        ), // OutlineInputBorder
        filled: true,
        fillColor: Color(0xffeaf6f2),
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xff353535)),
        prefixIcon: Icon(
          band ? Icons.key : Icons.person,
          color: Color(0xff27a985),
        ), // Icon
      ), // InputDecoration
    ); // TextFormField
  }
}

//clic derecho -> Refactor -> Extract Flutter Widget
class NewWidgetLabelText extends StatelessWidget {
  const NewWidgetLabelText({
    super.key, required this.texto
  });

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          texto,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
          ), // TextStyle
        ) // Text
      ],
    ); // Row
  }
}