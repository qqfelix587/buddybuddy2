import 'package:buddybuddy/services/auth.dart';
import 'package:buddybuddy/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(

                child: Text("BuddyBuddy",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 55.0,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.purple,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),),
                width: MediaQuery.of(context).size.width * 0.75,
                height: 100.0,
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                  color: Colors.red,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children : <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if(result == null) {
                        setState(() {
                          loading = false;
                          error = 'Please supply a valid email';
                        });
                      }
                    }
                  }
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: RaisedButton(
                    color: Colors.red,
                    child: Row(

                      //mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children : <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white,
                              fontSize: 20.0
                          ),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null) {
                          setState(() {
                            loading = false;
                            error = 'Could not sign in with those credentials';
                          });
                        }
                      }
                    }
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 2.0),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Text('If you \'re new here, Create account',
                    style: TextStyle(
                      fontSize: 20.0,
                      decoration: TextDecoration.underline,
                      color: Colors.blueAccent
                      ,
                    ),
                  ),
                  onPressed: () => widget.toggleView(),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}