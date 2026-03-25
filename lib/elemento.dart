import 'dart:ui';

import 'package:flutter/material.dart';

class Elemento extends StatefulWidget {
  const Elemento({super.key});

  @override
  State<Elemento> createState() => _ElementoState();
}

class _ElementoState extends State<Elemento> {
  // Variable para controlar el cambio de color
  List<bool> estados = List.generate(28, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        estados[0] = !estados[0];
                      });
                    },
                    child: Container(
                      color: estados[10] ? const Color(0xAA000000) : Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: estados[2] != estados[10] ? Colors.yellow : Colors.blueGrey,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        estados[2] = !estados[2];
                      });
                    },
                    child: Container(
                      color: estados[1] != estados[10]  ? Colors.purple : Colors.black26,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        estados[1] = !estados[1];
                      });
                    },
                    child: Container(
                      color:  estados[0] != estados[10]  ? Colors.grey : Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        estados[4] = !estados[4];
                      });
                    },
                    child: Container(
                      color: estados[4] != estados[10] ? Colors.red : const Color(0xFF3D112E),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        estados[5] = !estados[5];
                      });
                    },
                    child: Container(
                      color: estados[5] != estados[10] ? Colors.cyan : const Color(0xF0F5C1E9),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        estados[6] = !estados[6];
                      });
                    },
                    child: Container(
                      color: estados[6] != estados[10] ? Colors.pink : const Color(0xF0C1C6F5),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        estados[7] = !estados[7];
                      });
                    },
                    child: Container(
                      color: estados[7] != estados[10] ? Colors.white : const Color(0xFA00043B),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: estados[10] ? const Color(0xDD180501) : Colors.limeAccent,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        estados [10] = !estados[10];
                      });
                    },
                    child: Container(
                      color: estados[10] ? const Color(0xAF2E0D3B) :Colors.indigoAccent,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: estados[10] ? const Color(0xFFFFDAFF) : Colors.tealAccent,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        estados [10] = !estados[10];
                      });
                    },
                    child: Container(
                      color: estados[10] ? const Color(0xFF83B1D4) : Colors.green,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: estados[10] ? Colors.transparent : Colors.blueAccent,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        estados[10] = !estados[10];
                      });
                    },
                    child: Container(
                      color: estados[10] ? Colors.purpleAccent : Colors.lightGreenAccent,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: estados[10] ? const Color(0xFFC0D483) : Colors.deepOrange,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        estados[10] = !estados[10];
                      });
                    },
                    child: Container(
                      color: estados[10] ? const Color(0xFFA8A37D) : Colors.brown,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: estados[10] ? const Color(0xFF641111) : const Color(0xFF2C1440),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: estados[10] ?  const Color(0xFF86188C) : const Color(0xFF377324),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: estados[10] ?  const Color(0xFF426600) : const Color(0xFF660D2B),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        estados[12] = !estados[12];
                      });
                    },
                    child: Container(
                      color: estados[12] != estados[10] ? const Color(0xFF6B555C) : const Color(0xFFBFBBBB),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: estados[12] != estados[10] ? const Color(0xFFCCA9B0) : const Color(0xFFD0CAEC),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        estados[12] = !estados[12];
                      });
                    },
                    child: Container(
                      color: estados[12] != estados[10] ? const Color(0xFF16242E) : const Color(0x0F2C2838),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: estados[12] != estados[10] ? const Color(0xFF978AA8) : const Color(0xFF0F4F57),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        estados[12] = !estados[12];
                      });
                    },
                    child: Container(
                      color: estados[12] != estados[10] ? const Color(0xFFDB8A8A): const Color(0xFF2CFF00),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        estados[15] = !estados[15];
                      });
                    },
                    child: Container(
                      color: estados[10] ? Colors.white24 : const Color(0xFF3C4528),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: estados[10] ? Colors.lightBlueAccent : const Color(0xFFC2EB7A),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: estados[10] ?  Colors.cyanAccent : const Color(0xFFFF00AB),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: estados[15] != estados[10] ? const Color(0xFFCD9BFA) : const Color(0xFFB9C781),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Row(
//   children: [
//     Expanded(
//       flex: 4,
//         child: Container(
//       width: size.width * 0.5,
//       height: size.height * 0.1,
//       color: Colors.blue,
//       child: Container(
//         color: Color(0xFF2776F5),
//         child: Text(
//           "Contenedor",
//           style: TextStyle(
//               fontSize: 30.5,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//               letterSpacing: 1.5
//           ),
//         ),
//       ),
//     )),
//     Expanded(
//       flex: 10,
//         child: Container(
//       color: Color(0xFFF2F527),
//       child: Text(
//         "Contenedor",
//         style: TextStyle(
//             fontSize: 30.5,
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//             letterSpacing: 1.5
//         ),
//       ),
//     ))
//   ],
// ),
// Row(
//   children: [
//     Expanded(child: Container(
//       width: size.width * 0.5,
//       height: size.height * 0.1,
//       color: Colors.blue,
//       child: Container(
//         color: Color(0xFFF54927),
//         child: Text(
//           "Contenedor",
//           style: TextStyle(
//               fontSize: 30.5,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//               letterSpacing: 1.5
//           ),
//         ),
//       ),
//     )),
//     Expanded(child: Container(
//       color: Color(0xFF000000),
//       child: Text(
//         "Hola"
//       ),
//     ))
//   ],
// )