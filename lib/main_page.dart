import 'package:flutter/material.dart';

const TextStyle _textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<Widget> pages = const [
    Text(
      'eco',
      style: _textStyle,
    ),
    Text(
      'home',
      style: _textStyle,
    ),
    Text(
      'person',
      style: _textStyle,
    ),
    Text(
      'video',
      style: _textStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Map'),
      ),
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.white.withOpacity(0.5),
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
        child: NavigationBar(
          backgroundColor: Colors.teal,
          animationDuration: const Duration(seconds: 1),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 60,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(Icons.eco),
                icon: Icon(Icons.eco_outlined),
                label: 'eco'),
            NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'home'),
            NavigationDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outlined),
                label: 'person'),
            NavigationDestination(
                selectedIcon: Icon(Icons.video_camera_back),
                icon: Icon(Icons.video_camera_back),
                label: 'video')
          ],
        ),
      ),
    );
  }
}
