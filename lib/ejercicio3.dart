import 'package:flutter/material.dart';
// Asegúrate de tener esta dependencia en tu pubspec.yaml: sleek_circular_slider
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() => runApp(const Ejercicio3());

class Ejercicio3 extends StatefulWidget {
  const Ejercicio3({super.key});

  @override
  State<Ejercicio3> createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleek Circular Slider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // Añadí un tema oscuro para que luzca mejor
      home: const HomePage(),
    );
  }
}

// Faltaba definir esta clase:
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleek Circular Slider'),
        centerTitle: true,
      ),
      body: Center(
        child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
            customColors: CustomSliderColors(
              progressBarColor: Colors.blueAccent,
              dotColor: Colors.white,
              trackColor: Colors.grey[800],
            ),
            infoProperties: InfoProperties(
              mainLabelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          min: 0,
          max: 100,
          initialValue: 50,
          onChange: (double value) {
            print('Valor actual: $value');
          },
        ),
      ),
    );
  }
}