import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  int _currentIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GDiceSC",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text( "GDiceSC" ),
          centerTitle: true,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (newIndex) => setState( () => _currentIndex = newIndex ),
          children: const [
            Center( child: Text( "Home") ),
            Center( child: Text( "Settings") ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (newIndex) {
            setState( () => _currentIndex = newIndex );
            _pageController.jumpToPage(_currentIndex);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon( Icons.home ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon( Icons.settings ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
