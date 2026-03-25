import 'package:ejercicio1/utils/constantes.dart' as con;
import 'package:ejercicio1/utils/singleton.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Singleton singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: con.color1,
        leading: null,//Icon(Icons.arrow_back),
        title: Column(
          children: [
            Text("Hola", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      drawer: Drawer(
        backgroundColor: con.color3,
        elevation: 6,
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.home,
                color: con.color1,
              ),
              title: Text("HOME", style: TextStyle(color: con.color2),),
              subtitle: Text("Vista Principal", style: TextStyle(color: con.color2),),
            ),
            Divider(indent: 25, endIndent: 25),
            ListTile(
              leading: Icon(
                Icons.map,
                color: con.color1,
              ),
              title: Text("MAPA", style: TextStyle(color: con.color2),),
              subtitle: Text("Vista Principal", style: TextStyle(color: con.color2),),
            ),
            Divider(indent: 25, endIndent: 25),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: con.color1,
              ),
              title: Text("CONFIGURACIONES", style: TextStyle(color: con.color2),),
              subtitle: Text("Vista Principal", style: TextStyle(color: con.color2),),
            ),
            Divider(indent: 25, endIndent: 25),

          ],
        ),
      ),
      body: Column(
        children: [
          Card(
            elevation: 8,
            color: con.color1,
            margin: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: con.color2,
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        color: con.color1,
                        size: 35,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'Bienvenido',
                          style: TextStyle(
                            color: con.color2,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '${singleton.nameUser} ${singleton.lastNameUser}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('\$ ${singleton.wallet}'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: singleton.movimientos.length,
              itemBuilder: (context, index) {
                final mov = singleton.movimientos[index];
                return InkWell(
                  onTap: () {
                    print(mov);
                    setState(() {
                      //singleton.deleteMov(mov['id']);
                      singleton.addMov(
                        {
                          'id': singleton.movimientos.length + 1,
                          'monto': '50',
                          'fecha': '21/02/2026',
                          'hora': '11:15 PM',
                          'lugar': 'BBVA',
                          'asunto': 'Transferencia',
                          'estatus': 1,
                        },
                      );
                    });
                  },
                  child: Card(
                    margin: EdgeInsets.only(
                      left: size.width * 0.1,
                      bottom: 10,
                      right: size.width * 0.1,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(mov['lugar']),
                            const SizedBox(width: 10),
                            Text('${mov['fecha']} ${mov['hora']}'),
                          ],
                        ),
                        Text('\$ ${mov['monto']}'),
                        Row(
                          children: [
                            Text(mov['asunto']),
                            const SizedBox(width: 10),
                            Text(mov['estatus'].toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}