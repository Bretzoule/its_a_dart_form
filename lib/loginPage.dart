import 'package:flutter/material.dart';
import './form.dart' as Form;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _body());
  }

  _buildLogo() {
    var image = Image.asset(
      'assets/images/test.png',
      height: 100,
      width: 200,
      fit: BoxFit.fitWidth,
    );
    return image;
  }

  _body() {
    var column = Column(
      mainAxisSize: MainAxisSize.min,
      children: [_buildLogo(), Container(height: 32.0), Form.MyCustomForm()],
    );
    return Center(
      child: SingleChildScrollView(
        child: column,
      ),
    );
  }
}
