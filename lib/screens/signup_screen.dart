import 'package:currency_converter/providers/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key key}) : super(key: key);
  static const routeName = '/signup';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _signinKey = GlobalKey();

  Map<String, String> _signupData = {
    'user': '',
    'password': '',
    'passwordConfirmation': '',
  };

  final _passwordController = TextEditingController();

  final _userController = TextEditingController();

  final _passwordConfirmationController = TextEditingController();

  Future<void> _submit() async {
    if (!_signinKey.currentState.validate()) {
      return;
    }
    _signinKey.currentState.save();

    try {
      await Provider.of<Authentication>(context, listen: false).saveUser(
        _signupData['userName'],
        _signupData['password'],
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
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        padding: const EdgeInsets.only(
          top: 25.0,
          left: 15.0,
          right: 15.0,
        ),
        child: Form(
          key: _signinKey,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username or Email',
                  ),
                  controller: _userController,
                  validator: (val) {
                    if (val.isEmpty) return 'Field empty';
                    return null;
                  },
                  onSaved: (user) {
                    _signupData['userName'] = user;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (val) {
                    if (val.isEmpty) return 'Field empty.';
                    return null;
                  },
                  onSaved: (pass) {
                    _signupData['password'] = pass;
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Password Confirmation'),
                  obscureText: true,
                  controller: _passwordConfirmationController,
                  validator: (val) {
                    if (val != _passwordController.text)
                      return 'Password not match.';
                    return null;
                  },
                  onSaved: (passConfirmation) {
                    _signupData['passwordConfirmation'] = passConfirmation;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: MaterialButton(
                    onPressed: _submit,
                    minWidth: deviceSize.width,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.save),
                        ),
                      ],
                    ),
                    color: Color(0xFFFFD185),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
