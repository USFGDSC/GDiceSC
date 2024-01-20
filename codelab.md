summary: USF GDSC Spring 2024 Flutter Workshop
id: usf_gdsc_spring_2024_flutter_workshop
categories: flutter
status: draft

# USF GDSC Spring 2024 Flutter Workshop

## Introduction

We're gonna make a dice roll app called GDiceSC.

<img src="usf_gdsc_spring_2024_flutter_workshop\img\intro.gif" width="270" height="600">

## Default Flutter app

Replace the starter app with a base to start from.

<img src="usf_gdsc_spring_2024_flutter_workshop\img\default_flutter_app.png" width="270" height="600">

main.dart
```dart
import 'package:flutter/material.dart';

void main() {
  runApp( const MaterialApp(
    title: "GDiceSC",
    home: GDiceSC(),
  ));
}

class GDiceSC extends StatefulWidget {
  const GDiceSC({super.key});

  @override
  State<GDiceSC> createState() => _GDiceSCState();
}

class _GDiceSCState extends State<GDiceSC> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
```

## Standard app layout

Build a layout common among most mobile apps.

<img src="usf_gdsc_spring_2024_flutter_workshop\img\standard_app_layout.gif" width="270" height="600">

main.dart
```dart
import 'package:flutter/material.dart';

void main() {
  runApp( const MaterialApp(
    title: "GDiceSC",
    home: GDiceSC(),
  ));
}

class GDiceSC extends StatefulWidget {
  const GDiceSC({super.key});

  @override
  State<GDiceSC> createState() => _GDiceSCState();
}

class _GDiceSCState extends State<GDiceSC> {

  int _currentIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( "GDiceSC" ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (selectedIndex) => setState( () => _currentIndex = selectedIndex ),
        children: const [
          Placeholder(),
          Placeholder(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (selectedIndex) {
          setState( () => _currentIndex = selectedIndex );
          _pageController.jumpToPage(_currentIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
```

## Seperate page files

Create home.dart and settings.dart to build the home and settings page then import them in main.dart.

<img src="usf_gdsc_spring_2024_flutter_workshop\img\seperate_page_files.gif" width="270" height="600">

home.dart
```dart
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
```

settings.dart
```dart
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Settings'),
        ),
      ),
    );
  }
}
```

main.dart
```dart
import 'package:flutter/material.dart';

import 'home.dart';     // import home.dart
import 'settings.dart'; // import settings.dart

void main() {
  runApp( const MaterialApp(
    title: "GDiceSC",
    home: GDiceSC(),
  ));
}

class GDiceSC extends StatefulWidget {
  const GDiceSC({super.key});

  @override
  State<GDiceSC> createState() => _GDiceSCState();
}

class _GDiceSCState extends State<GDiceSC> {

  int _currentIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( "GDiceSC" ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (selectedIndex) => setState( () => _currentIndex = selectedIndex ),
        children: const [
          HomePage(),       // replace placeholder with home page
          SettingsPage(),   // replace placeholder with settings page
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (selectedIndex) {
          setState( () => _currentIndex = selectedIndex );
          _pageController.jumpToPage(_currentIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
```

## User input elements

Let the user set how many sides the dice will have on the settings page.

<img src="usf_gdsc_spring_2024_flutter_workshop\img\user_input_elements.gif" width="270" height="600">

settings.dart
```dart
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
            min: 2,
            max: 20,
            divisions: 18,
            value: sides,
            onChanged: (value) => setState( () => sides = value ),
          ),
        ],
      )
    );
  }
}
```

## Main app feature

Let the user roll the dice in the home page.

<img src="usf_gdsc_spring_2024_flutter_workshop\img\main_app_feature.gif" width="270" height="600">

home.dart
```dart
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
          Center( child: Text( "$_curr", style: const TextStyle( fontSize: 256 ) ) ),
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
```

## Design app theme

Change colors and other visual features with theme data.

<img src="usf_gdsc_spring_2024_flutter_workshop\img\design_app_theme.gif" width="270" height="600">

main.dart
```dart
import 'package:flutter/material.dart';

import 'home.dart';
import 'settings.dart';

void main() {
  runApp( MaterialApp(
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      sliderTheme: const SliderThemeData(
        activeTrackColor: Colors.red,
        inactiveTrackColor: Colors.black,
        thumbColor: Colors.red,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Colors.white,
        actionTextColor: Colors.red,
        contentTextStyle: TextStyle(
          color: Colors.black,
        ),
        behavior: SnackBarBehavior.floating,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
      ),
    ),
    title: "GDiceSC",
    home: const GDiceSC(),
  ));
}

class GDiceSC extends StatefulWidget {
  const GDiceSC({super.key});

  @override
  State<GDiceSC> createState() => _GDiceSCState();
}

class _GDiceSCState extends State<GDiceSC> {

  int _currentIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( "GDiceSC" ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (selectedIndex) => setState( () => _currentIndex = selectedIndex ),
        children: const [
          HomePage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (selectedIndex) {
          setState( () => _currentIndex = selectedIndex );
          _pageController.jumpToPage(_currentIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
```

## Conclusion

Good job.

<img src="usf_gdsc_spring_2024_flutter_workshop\img\stand_proud.jpeg">