import 'package:buddybuddy/screens/authenticate/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Register_choose extends StatefulWidget {
  final Function toggleView;
  Register_choose({ this.toggleView });

  @override
  _Register_chooseState createState() => _Register_chooseState();
  bool loading = false;

}

class _Register_chooseState extends State<Register_choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height * 0.95,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                child: Text("BuddyBuddy",
                  style: TextStyle(
                    color: Colors.purple[700],
                    fontSize: 55.0,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.purple,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),),
              ),
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.33,
            ),
            SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Container(
                child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
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
                          'Authenticate with Google',
                          style: TextStyle(color: Colors.white,
                              fontSize: 20.0
                          ),
                        ),
                      ],
                    ),
                    onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Register()))
                ),
              ),
              SizedBox(height:10,),
              Container(
                child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
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
                          'Authenticate with KaKao',
                          style: TextStyle(color: Colors.white,
                              fontSize: 20.0
                          ),
                        ),
                      ],
                    ),
                    onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Register()))
                ),
              ),
                SizedBox(height: 10,),
                Container(
                  child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
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
                            'Authenticate with KaKao',
                            style: TextStyle(color: Colors.white,
                                fontSize: 20.0
                            ),
                          ),
                        ],
                      ),
                      onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Register()))
                  ),
                ),
                SizedBox(height: 40,),

                Container(
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Text('If you have account, Sign In',
                    style: TextStyle(
                      fontSize: 20.0,
                      decoration: TextDecoration.underline,
                      color: Colors.blueAccent
                      ,
                    ),
                  ),
                  onPressed: () => widget.toggleView(),

                ),
              )
            ],)
          ],
        ),
      )
    );
  }
}
