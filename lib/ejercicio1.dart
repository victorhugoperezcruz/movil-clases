
import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:flutter/cupertino.dart';


class Ejercicio1 extends StatefulWidget {
  const Ejercicio1({super.key});


  @override
  State<Ejercicio1> createState() => _Ejercicio1State();
}

final emojiPresets = {
  'notoAnimatedEmojis': notoAnimatedEmojis,
  'classicEmojiPreset': classicEmojiPreset,
  'threeDEmojiPreset': threeDEmojiPreset,
  'handDrawnEmojiPreset': handDrawnEmojiPreset,
};

class _Ejercicio1State extends State<Ejercicio1> {
  int? rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              ...emojiPresets.entries.map((entry) => Column(
                children: [
                  Text(entry.key),
                  EmojiFeedback(
                    initialRating: 3,
                    onChangeWaitForAnimation: true,
                    emojiPreset: entry.value,
                    labelTextStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w400),
                    onChanged: (value) {
                      setState(() => rating = value);
                      // Show snackbar
                      ScaffoldMessenger.of(context)
                        ..clearSnackBars()
                        ..showSnackBar(SnackBar(content: Text('$value')));
                    },
                  )
                ],
              )),
              Column(
                children: [
                  const Text("Custom preset builder"),
                  EmojiFeedback(
                    initialRating: 3,
                    onChangeWaitForAnimation: true,
                    presetBuilder: (p0, p1, p2) => const Icon(Icons.star),
                    labelTextStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w400),
                    onChanged: (value) {
                      setState(() => rating = value);
                      // Show snackbar
                      ScaffoldMessenger.of(context)
                        ..clearSnackBars()
                        ..showSnackBar(SnackBar(content: Text('$value')));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );;
  }
}
