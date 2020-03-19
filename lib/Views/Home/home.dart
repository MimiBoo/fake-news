import 'package:fake/models/userdata.dart';
import 'package:fake/services/auth.dart';
import 'package:fake/services/database.dart';
import 'package:fake/services/post.dart';
import 'package:fake/tools/themes.dart';
import 'package:fake/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final String uid;
  Home({this.uid});
  final AuthService _auth = AuthService();
  final PostService _post = PostService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  String title, content = '';

  @override
  Widget build(BuildContext context) {
    void _showPostingPanel() {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          backgroundColor: Colors.transparent,
          isDismissible: true,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'New post',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Baloo',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Title:',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Baloo',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.top),
                        child: TextFormField(
                          decoration: textInputDecoration,
                          onChanged: (value) => title = value,
                          validator: (value) =>
                              value.isEmpty ? 'Title can\'t be empty' : null,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.top),
                        child: Text(
                          'Content:',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Baloo',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: TextFormField(
                          decoration: textInputDecoration,
                          keyboardType: TextInputType.multiline,
                          onChanged: (value) => content = value,
                          minLines: 5,
                          maxLines: 5,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 3),
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              dynamic result = await _post.updateUserData(title,
                                  content, DateTime.now().toString(), uid);
                            }
                          },
                          child: Text(
                            'Post',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Baloo',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
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

/*showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            height: 500,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'New post',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Baloo',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Title:',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Baloo',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextFormField(
                    decoration: textInputDecoration,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  Text(
                    'Content:',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Baloo',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextFormField(
                    decoration: textInputDecoration,
                    keyboardType: TextInputType.multiline,
                    minLines: 8,
                    maxLines: 8,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  RaisedButton(onPressed: () {})
                ],
              ),
            ),
          );
        },
      ); */
