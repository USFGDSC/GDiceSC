import 'package:flutter/material.dart';

import 'account.dart';
import 'home.dart';
import 'settings.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
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
        actions: [
          IconButton(
            icon: const Icon( Icons.person ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute( builder: (context) => const AccountPage() ),
              );
            },
          ),
        ],
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