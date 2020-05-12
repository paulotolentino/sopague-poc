import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/home_screen.dart';
import 'package:flutter_login_ui/screens/login_screen.dart';
import 'package:flutter_login_ui/utilities/CreateAPI.dart';
import 'package:flutter_login_ui/utilities/globalFunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_login_ui/utilities/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)=> MaterialApp(home: VerifyLogged());
}

class VerifyLogged extends StatefulWidget {
  @override
  _VerifyLoggedState createState() => _VerifyLoggedState();
}

class _VerifyLoggedState extends State<VerifyLogged> {
  TextEditingController nameController = TextEditingController();

  int isLoggedIn;

  @override
  void initState(){
    super.initState();
    autoLogin();
  }

  void autoLogin() async {

    var _api = CreateAPI();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String _rememberMe = prefs.getString(KEEPMELOGGEDIN);
    print(_rememberMe);
    final String email = prefs.getString(EMAIL);
    final String senha = prefs.getString(PASSWORD);

    if(_rememberMe != null){
      await tryLogin(email, senha, true, _api, context);
      Timer(Duration(seconds: 3), () => setState(() {
        isLoggedIn = 1;
      }));
      return;
    }
    Timer(Duration(seconds: 3), () => setState(() {
      isLoggedIn = 0;
    }));
    return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: SOPAGUE,
      debugShowCheckedModeBanner: false,
      home: isLoggedIn == 1 ? HomeScreen() : isLoggedIn == 0 ? LoginScreen(logged: false,) :
      Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.0, 0.0, 0.7, 0.9],
              ),
            ),
          ),
          Container(
              height: double.infinity,
              child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                          "https://app.sopague.com/assets/app-assets/tela-login/images/logo-pague-white.png",
                          width: 300,
                        ),
                      ],
                    ),
                  )
              )
          )
        ],
      ),
    );
  }
}
