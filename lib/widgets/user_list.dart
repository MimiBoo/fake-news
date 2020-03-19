import 'package:fake/models/userdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<List<UserData>>(context);

    return Container(
      height: double.infinity,
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                child: Icon(Icons.person_outline),
                backgroundColor: Colors.black,
              ),
              SizedBox(width: 5),
              Text(userData[0].username)
            ],
          ),
        ],
      ),
    );
  }
}
