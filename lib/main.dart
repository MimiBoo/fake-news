import 'package:fake/Views/wrapper.dart';
import 'package:fake/models/user.dart';
import 'package:fake/services/auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Fake News',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xffeeeeee),
          
          scaffoldBackgroundColor: Color(0xffeeeeee),
        ),
        home: Wrapper(),
      ),
    );
  }
}

/*
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.black),
            ),
          ),*/
