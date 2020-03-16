import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String title;
  final bool isPassword;

  const CustomField({Key key, @required this.title, this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              offset: Offset(-12, -12),
              blurRadius: 12,
              color: Color(0xFFFFFFFF).withOpacity(1),
            ),
            BoxShadow(
              offset: Offset(12, 12),
              blurRadius: 12,
              color: Color(0xFF000000).withOpacity(.1),
            ),
          ]),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 7,
        top: 25,
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onSaved: (input) {},
        style: TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
        obscureText: isPassword ? true : false,
        decoration: InputDecoration.collapsed(
          hintText: title,
          hintStyle: TextStyle(letterSpacing: 1.5, fontSize: 20),
        ),
      ),
    );
  }
}
