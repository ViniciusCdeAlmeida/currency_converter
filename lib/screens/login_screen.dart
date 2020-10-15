import 'dart:math';

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
                // Flexible(
                //   child: Container(
                //     margin: const EdgeInsets.only(bottom: 20.0),
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 8.0, horizontal: 94.0),
                //     transform: Matrix4.rotationZ(-8 * pi / 180)
                //       ..translate(-10.0),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: Colors.deepOrange.shade900,
                //       boxShadow: [
                //         BoxShadow(
                //           blurRadius: 8,
                //           color: Colors.black26,
                //           offset: Offset(0, 2),
                //         ),
                //       ],
                //     ),
                //     child: const Text(
                //       'App Inventario',
                //     ),
                //   ),
                // ),
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
