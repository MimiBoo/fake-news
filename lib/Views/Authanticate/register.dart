import 'package:fake/services/auth.dart';
import 'package:fake/tools/themes.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String username = '';
  String fisrtName = '';
  String lastName = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign up'),
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            label: Text('Sign in'),
            icon: Icon(Icons.person),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    fisrtName = value;
                  });
                },
                validator: (value) => value.isEmpty ? 'Enter a first name' : null,
                decoration:
                    textInputDecoration.copyWith(hintText: 'First Name'),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    lastName = value;
                  });
                },
                validator: (value) => value.isEmpty ? 'Enter a last name' : null,
                decoration: textInputDecoration.copyWith(hintText: 'Last Name'),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                validator: (value) => value.isEmpty ? 'Enter a username' : null,
                decoration: textInputDecoration.copyWith(hintText: 'Username'),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                validator: (value) => value.isEmpty ? 'Enter an email' : null,
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                validator: (value) =>
                    value.length < 6 ? 'Enter a password 6+ chars long' : null,
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.registerWithEmailAndPasswors(
                        email, password, username, fisrtName, lastName);
                    if (result == null) {
                      setState(() {
                        error = 'Please supply a valid email';
                        loading = false;
                      });
                    }
                  }
                },
                color: Colors.white,
                child: Text('Sign up'),
              ),
              SizedBox(height: 20),
              Text(
                error,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
