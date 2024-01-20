import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

double sides = 6;

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( "Dice sides: ${sides.round()}", style: const TextStyle( fontSize: 32 ) ),
          Slider(
            min: 1,
            max: 20,
            divisions: 19,
            value: sides,
            onChanged: (value) => setState( () => sides = value ),
          ),
        ],
      )
    );
  }
}