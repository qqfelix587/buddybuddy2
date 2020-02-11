import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_ui_test/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Email', style: kLabelStyle),
        SizedBox(height: MediaQuery.of(context).size.height * 0.014),
        Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: MediaQuery.of(context).size.height * 0.059,
            child: TextFormField(
              validator: (val) => val.isEmpty ? 'Enter an email' : null,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
              decoration: InputDecoration(
                border: InputBorder.none,
                //contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your Email',
                hintStyle: kHintTextStyle,
              ),
            ))
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Password', style: kLabelStyle),
        SizedBox(height: MediaQuery.of(context).size.height * 0.014),
        Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: MediaQuery.of(context).size.height * 0.059,
            child: TextFormField(
              validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                //contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Enter your Password',
                hintStyle: kHintTextStyle,
              ),
            ))
      ],
    );
  }

  Widget _buildRememberMe() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.028,
      child: Row(
        children: <Widget>[
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: _rememberMe,
                checkColor: Colors.deepPurple,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value;
                  });
                },
              )),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
        padding: EdgeInsets.only(right: 0.0),
        child: FlatButton(
          onPressed: () => print('Forgot Password Button Pressed'),
          padding: EdgeInsets.only(right: 0.0),
          child: Text(
            'Forgot Password?',
            style: kLabelStyle,
          ),
        ));
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.005, horizontal: MediaQuery.of(context).size.width * 0.073),
      width: double.infinity,
      child: RaisedButton(
       //elevation:  MediaQuery.of(context).size.height * 0.007,
        onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.007, horizontal:  MediaQuery.of(context).size.width * 0.048),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.purple,
            letterSpacing: 1.5,
            fontSize:  MediaQuery.of(context).size.height * 0.025,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        SizedBox(height:MediaQuery.of(context).size.height * 0.050 ,),
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo){
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: MediaQuery.of(context).size.height * 0.070,
          width: MediaQuery.of(context).size.height * 0.070,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(5, 13),
                  blurRadius: 4.0)
            ],
            image: DecorationImage(image: logo),
          )
      ),
    );
  }
  Widget _buildSocialBtnRow(){
    return
    Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.025, horizontal: MediaQuery.of(context).size.width * 0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        _buildSocialBtn(() => print('Login with Kakao'), AssetImage('assets/logos/Kakao.png')),
        _buildSocialBtn(() => print('Login with Google'), AssetImage('assets/logos/google.jpg')),
      ],),
    );
  }
  Widget _buildSignupBtn(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
              padding: EdgeInsets.symmetric(vertical:  MediaQuery.of(context).size.height * 0.028),
              child: Text(
                  'Don\'t have an Account? ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:  MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.w400
                  )
              ),
            ),
        Container(
            width: MediaQuery.of(context).size.width * 0.20,
            padding: EdgeInsets.all(0.0),
            margin:  EdgeInsets.all(0.0),
            child: FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () => print('Forgot Password Button Pressed'),
              child: Text(
                'SignUp',
                 style:  TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.048,
                      fontWeight: FontWeight.bold
                  ),
              ),
            )),
      ],
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.purple])),
          ),


          SafeArea(
            child: Container(

                height: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.073,
                    vertical: MediaQuery.of(context).size.height * 0.014,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.16,

                        child: Center(
                          child: Text(
                            "BuddyBuddy",
                            style: TextStyle(
                              color: Colors.purple[700],
                              fontSize: MediaQuery.of(context).size.height * 0.06,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.028,
                      ),
                      Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize:  MediaQuery.of(context).size.height * 0.031,
                            fontWeight: FontWeight.bold),
                      ),

                      _buildEmailTF(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.010,
                      ),
                      _buildPasswordTF(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 0.0),
                        //width: MediaQuery.of(context).size.height * 1.00,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                          _buildRememberMe(),

                          _buildForgotPasswordBtn(),
                        ],),
                      ),
                      _buildLoginBtn(),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                     // SizedBox(height: MediaQuery.of(context).size.height * 0.022,),
                      _buildSignupBtn(),
                    ],
                  ),
                )),
          ),
      ],
    ),

    );
  }
}



