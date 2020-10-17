import 'package:currency_converter/providers/authentication.dart';
import 'package:currency_converter/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Menu'),
            automaticallyImplyLeading: false,
            leading: Icon(Icons.menu_open),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Provider.of<Authentication>(context, listen: false).loguot();
              Provider.of<Currencies>(context, listen: false).clean();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
