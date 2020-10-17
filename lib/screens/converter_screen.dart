import 'package:currency_converter/custom/appDrawer.dart';
import 'package:currency_converter/models/serialized/currency.dart';
import 'package:currency_converter/models/serialized/user.dart';
import 'package:currency_converter/providers/authentication.dart';
import 'package:currency_converter/screens/currency_screen.dart';
import 'package:currency_converter/screens/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  Authentication _actualUser;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    _actualUser = Provider.of<Authentication>(context);
    super.didChangeDependencies();
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
            title: const Text('Converter'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            title: const Text('History'),
          ),
        ],
      ),
    );
  }
}
