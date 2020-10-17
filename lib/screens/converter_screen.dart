import 'package:currency_converter/screens/currency_screen.dart';
import 'package:currency_converter/screens/history_screen.dart';
import 'package:flutter/material.dart';

class ConverterScreen extends StatefulWidget {
  static const routeName = '/converter';

  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CurrencyScreen(),
    HistoryScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.attach_money),
            label: 'Converter',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
