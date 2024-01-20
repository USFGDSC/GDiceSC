import 'dart:math';

import 'package:flutter/material.dart';

import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _prev = 0;
  int _curr = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center( child: Text( "Previous roll: $_prev" ) ),
          Center( child: Text( "Current roll: $_curr" ) ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.refresh ),
        onPressed: () {
          setState( () {
            _prev = _curr;
            _curr = Random().nextInt( sides.round() ) + 1;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}