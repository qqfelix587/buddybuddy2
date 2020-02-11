import 'package:buddybuddy/services/auth.dart';
import 'package:buddybuddy/shared/constant.dart';
import 'package:buddybuddy/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  bool _rememberMe = false;
  bool emailError = true;
  bool passwordError = true;
  // text field state
  String email = '';
  String password = '';
  bool insert_on = false;
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
              onChanged: (val) {
                setState(() {
                  email = val;
                  if(val.length == 0)
                    insert_on = false;
                  else
                    insert_on = true;
                  if(EmailValidator.validate(email))
                    emailError = false;
                  else
                    emailError = true;
                });
              },
            )),
        Container(alignment: Alignment.centerRight,child: Text(emailError ? 'Please Enter a valid email': '', style: TextStyle(
          color: Colors.red[700]
        ))),

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
              onChanged: (val) {
                setState(() {
                  password = val;
                  insert_on = true;
                  if(val.length == 0)
                    insert_on = false;
                  if(password.length >= 6)
                    passwordError = false;
                  else
                    passwordError = true;
                });
              },
            )),
        Container(alignment: Alignment.centerRight,child: Text(passwordError ? 'Enter a password 6+ chars long': '', style: TextStyle(
            color: Colors.red[700]
        ))),
      ],
    );
  }

  Widget _buildRememberMe() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.028,

      //height: MediaQuery.of(context).size.height * 0.020,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              fontSize: MediaQuery.of(context).size.height * 0.020,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.028,
        child: FlatButton(
          onPressed: () => print('Forgot Password Button Pressed'),
          padding: EdgeInsets.all(0.0),
          child: Text(
            'Forgot Password?',
            style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
            fontSize: MediaQuery.of(context).size.height * 0.020,
          ),
        )));
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.fromLTRB( MediaQuery.of(context).size.width * 0.073, MediaQuery.of(context).size.height * 0.007,  MediaQuery.of(context).size.width * 0.073, 0.0),

      width: double.infinity,
      child: RaisedButton(
        //elevation:  MediaQuery.of(context).size.height * 0.007,
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
          },
        padding: EdgeInsets.symmetric( horizontal:  MediaQuery.of(context).size.width * 0.048),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: insert_on? Colors.purple: Colors.purple[100],
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
        SizedBox(height:MediaQuery.of(context).size.height * 0.030 ,),
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
              onPressed: () => widget.toggleView(),
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
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
                child: Form(
                  key: _formKey,
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
                          padding: EdgeInsets.symmetric(vertical : MediaQuery.of(context).size.height * 0.007, horizontal: 0.0),
                          //width: MediaQuery.of(context).size.height * 1.00,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              _buildRememberMe(),
                              _buildForgotPasswordBtn(),
                            ],),
                        ),
                        _buildLoginBtn(),
                        Container(
                          child: Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: MediaQuery.of(context).size.height * 0.022, fontWeight: FontWeight.w600),
                          ),
                        ),
                        _buildSignInWithText(),
                        _buildSocialBtnRow(),
                        // SizedBox(height: MediaQuery.of(context).size.height * 0.022,),
                        _buildSignupBtn(),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),

    );
  }
}
