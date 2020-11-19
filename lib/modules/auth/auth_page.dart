import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  final String title;

  const AuthPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
