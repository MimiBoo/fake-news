import 'package:fake/tools/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Function onPressed;
  const CustomButton({Key key, @required this.title, this.titleColor=textDefaultBlack, @required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4, top: 50, right: 50),
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
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
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: RaisedButton(
          onPressed: () {},
          elevation: 0,
          color: Theme.of(context).primaryColor,
          child: Text(
            title,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 18, color: titleColor),
          ),
        ),
      ),
    );
  }
}
