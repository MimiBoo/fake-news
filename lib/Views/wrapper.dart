import 'package:fake/Views/Authanticate/authanticate.dart';
import 'package:fake/Views/Home/home.dart';
import 'package:fake/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either Home or Authanticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
