import 'package:currency_converter/custom/customLine.dart';
import 'package:currency_converter/main.dart';
import 'package:currency_converter/providers/authentication.dart';
import 'package:currency_converter/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';
import 'package:provider/provider.dart';

class LoginItem extends StatefulWidget {
  LoginItem({Key key}) : super(key: key);

  @override
  _LoginItemState createState() => _LoginItemState();
}

class _LoginItemState extends State<LoginItem> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _loginData = {
    'user': '',
    'password': '',
  };

  final _passwordController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    try {
      await Provider.of<Authentication>(context, listen: false).getUser(
        _loginData['userName'],
        _loginData['password'],
      );
    } catch (error) {
      await showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error.'),
          content: const Text('Error.'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('OK'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height,
      width: deviceSize.width,
      padding: const EdgeInsets.only(
        top: 25.0,
        left: 15.0,
        right: 15.0,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username or Email',
                ),
                onSaved: (user) {
                  _loginData['userName'] = user;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                controller: _passwordController,
                onSaved: (pass) {
                  _loginData['password'] = pass;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: showButton(
                  deviceSize: deviceSize,
                  text: "LOG IN",
                  icon: null,
                  color: Color(0xFFFFD185),
                  func: _submit,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: showButton(
                  deviceSize: deviceSize,
                  text: "SIGN UP",
                  icon: null,
                  color: Color(0xFFFFA185),
                  context: context,
                  func: _signupScreen,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                child: customLine(deviceSize),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: showButton(
                  deviceSize: deviceSize,
                  text: "LOGIN WITH FACEBOOK",
                  icon: Icons.place,
                  color: Color(0xFF3C4858),
                  func: _dbScreen,
                  context: context,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: showButton(
                  deviceSize: deviceSize,
                  text: "LOGIN WITH TWITTER",
                  icon: Icons.search,
                  color: Color(0xFF8492A6),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: showButton(
                  deviceSize: deviceSize,
                  text: "LOGIN WITH GOOGLE",
                  icon: Icons.query_builder,
                  color: Color(0xFFC0CCDA),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customLine(Size deviceSize) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CustomPaint(
        painter: CustomLine(true, deviceSize),
      ),
      Text('OR'),
      CustomPaint(
        painter: CustomLine(false, deviceSize),
      )
    ],
  );
}

void _signupScreen(BuildContext context) {
  Navigator.of(context).pushNamed(
    SignupScreen.routeName,
  );
}

void _dbScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => MoorDbViewer(db)));
}

Widget loading() {
  return CircularProgressIndicator();
}

Widget showButton({
  Size deviceSize,
  String text,
  IconData icon,
  Color color,
  BuildContext context,
  Function func,
}) {
  return MaterialButton(
    onPressed: () {
      context != null ? func(context) : func();
    },
    minWidth: deviceSize.width,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Icon(icon),
        ),
      ],
    ),
    color: color,
  );
}
