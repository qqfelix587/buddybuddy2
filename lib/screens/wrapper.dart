import 'package:buddybuddy/models/user.dart';
import 'package:buddybuddy/screens/authenticate/authenticate.dart';
import 'package:buddybuddy/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return either the Home or Authenticate widget
    if (user == null ){
      return Authenticate();
    } else {
      return Home();
    }
  }
}