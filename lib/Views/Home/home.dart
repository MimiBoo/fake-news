import 'package:fake/models/userdata.dart';
import 'package:fake/services/auth.dart';
import 'package:fake/services/database.dart';
import 'package:fake/tools/themes.dart';
import 'package:fake/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final String uid;
  Home({this.uid});
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    void _showPostingPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Theme.of(context).primaryColor,
            height: 500,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'New post',
                  style: TextStyle(fontSize: 35, fontFamily: 'Baloo'),
                ),
                TextFormField(
                  decoration: textInputDecoration,
                  keyboardType: TextInputType.multiline,
                  minLines: 10,
                  maxLines: 10,
                  textCapitalization: TextCapitalization.sentences,
                ),
              ],
            ),
          );
        },
      );
    }

    return StreamProvider<List<UserData>>.value(
      value: DatabaseService(uid: uid).users,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          elevation: 0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                loading = true;
                await _auth.signOut();
                loading = false;
              },
              label: Text('Logout'),
              icon: Icon(Icons.exit_to_app),
            )
          ],
        ),
        body: UserList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showPostingPanel(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
