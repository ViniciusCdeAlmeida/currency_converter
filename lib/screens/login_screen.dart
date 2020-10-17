import 'package:currency_converter/widgets/login_item.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your app'),
      ),
      // drawer: MenuDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: deviceSize.width > 600 ? 2 : 1,
                  child: LoginItem(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
