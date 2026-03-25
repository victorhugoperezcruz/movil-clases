import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:one_clock/one_clock.dart';

void main() {
  runApp(MaterialApp(home: Ejercicio4()));
}

class Ejercicio4 extends StatefulWidget {
  @override
  _Ejercicio4State createState() => _Ejercicio4State();
}

class _Ejercicio4State extends State<Ejercicio4> {
  final _controller00 = ValueNotifier<bool>(false);
  final _controller01 = ValueNotifier<bool>(false);
  final _controller02 = ValueNotifier<bool>(false);
  final _controller03 = ValueNotifier<bool>(false);
  final _controller04 = ValueNotifier<bool>(false);
  final _controller05 = ValueNotifier<bool>(false);
  final _controller06 = ValueNotifier<bool>(false);
  final _controller07 = ValueNotifier<bool>(false);
  final _controller08 = ValueNotifier<bool>(false);
  final _controller09 = ValueNotifier<bool>(false);
  final _controller10 = ValueNotifier<bool>(false);
  final _controller11 = ValueNotifier<bool>(false);
  final _controller12 = ValueNotifier<bool>(false);
  final _controller13 = ValueNotifier<bool>(false);
  final _controller14 = ValueNotifier<bool>(false);
  final _controller15 = ValueNotifier<bool>(false);

  bool _enabled = false;
  bool _initialValue = false;
  DateTime dateTime = DateTime.now();

  @override
  void dispose() {
    _controller00.dispose();
    _controller01.dispose();
    _controller02.dispose();
    _controller03.dispose();
    _controller04.dispose();
    _controller05.dispose();
    _controller06.dispose();
    _controller07.dispose();
    _controller08.dispose();
    _controller09.dispose();
    _controller10.dispose();
    _controller11.dispose();
    _controller12.dispose();
    _controller13.dispose();
    _controller14.dispose();
    _controller15.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AdvancedSwitch(controller: _controller00),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AdvancedSwitch(enabled: _enabled, initialValue: _initialValue, onChanged: (v) => setState(() => _initialValue = v)),
                ElevatedButton(onPressed: () => setState(() => _enabled = !_enabled), child: Text('Toggle Enable')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdvancedSwitch(activeChild: Text('1'), inactiveChild: Text('0'), controller: _controller02),
                AdvancedSwitch(width: 32, height: 16, controller: _controller07),
              ],
            ),

            SleekCircularSlider(
              appearance: CircularSliderAppearance(),
              initialValue: 50,
              onChange: (double value) => print(value),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AnalogClock(width: 100, height: 100, isLive: true, datetime: dateTime),
                  SizedBox(width: 10),
                  AnalogClock.dark(width: 100, height: 100, isLive: true, datetime: dateTime),
                ],
              ),
            ),
            SizedBox(height: 20),
            DigitalClock(isLive: true, datetime: dateTime, showSeconds: true),
            DigitalClock.dark(isLive: true, datetime: dateTime),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}