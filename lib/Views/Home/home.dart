import 'package:fake/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              loading = true;
              await _auth.signOut();
              loading=false;
            },
            label: Text('Logout'),
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
    );
  }
}
