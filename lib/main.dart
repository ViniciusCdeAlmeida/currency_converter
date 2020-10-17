import 'package:currency_converter/models/database/databaseMoor.dart';
import 'package:currency_converter/providers/authentication.dart';
import 'package:currency_converter/providers/currencies.dart';
import 'package:currency_converter/screens/currency_screen.dart';
import 'package:currency_converter/screens/login_screen.dart';
import 'package:currency_converter/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AppDatabase db;

void main() {
  db = AppDatabase();
  runApp(CurrencyConverter());
}

class CurrencyConverter extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Currencies(),
        ),
        ChangeNotifierProvider(
          create: (context) => Authentication(),
        )
      ],
      child: Consumer<Authentication>(
        builder: (ctx, authData, _) => MaterialApp(
          title: 'Currency Converter',
          theme: ThemeData(
            accentColor: Colors.white,
            fontFamily: 'Roboto',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          home: authData.isAuth ? CurrencyScreen() : LoginScreen(),
          routes: {
            CurrencyScreen.routeName: (ctx) => CurrencyScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            SignupScreen.routeName: (ctx) => SignupScreen(),
          },
        ),
      ),
    );
  }
}
