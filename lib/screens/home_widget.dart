import 'package:bankingapp/screens/home.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/home-icon.svg'),
            icon: Text('Home'),
          ),
        ],
      ),
    );
  }
}
