import 'package:fake/tools/colors.dart';
import 'package:fake/widgets/custombutton.dart';
import 'package:fake/widgets/customfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Form(
            key: formkey,
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                Positioned(
                  top: height / 2.5,
                  child: CustomField(
                    title: 'Username',
                  ),
                ),
                Positioned(
                  top: height / 1.9,
                  child: CustomField(
                    title: 'Password',
                    isPassword: true,
                  ),
                ),
                Positioned(
                  top: height / 1.5,
                  left: width / 12,
                  child: CustomButton(
                    title: 'Login',
                    onPressed: () {},
                    titleColor: textgreen,
                  ),
                ),
                Positioned(
                  bottom: height / 8,
                  left: width / 12,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 4,
                        top: 20,
                        right: 50),
                    child: Text("New to the app? Register."),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
