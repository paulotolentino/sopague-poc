import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/main.dart';
import 'package:flutter_login_ui/screens/home_screen.dart';
import 'package:flutter_login_ui/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void logOut(context) async {
  print("Logout pressed");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("userEmail", null);
  prefs.setString(TOKEN, null);
  prefs.setString(KEEPMELOGGEDIN, null);
  makeRoutePage(context: context, pageRef: VerifyLogged());
}

void makeRoutePage({BuildContext context, Widget pageRef}) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => pageRef),
          (Route<dynamic> route) => false);
}

Future<bool> tryLogin(String email, String senha, bool rememberMe, var api, context) async {
  try{
    http.Response firstLogin = await http.post(api.firstLogin, body: {'email': email, 'password': senha});
    bool success = json.decode(firstLogin.body)[SUCCESS];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(success){
      String token = json.decode(firstLogin.body)[TOKEN];
      if(rememberMe) {
        prefs.setString(KEEPMELOGGEDIN, TRUE);
        prefs.setString(EMAIL, email);
        prefs.setString(PASSWORD, senha);
      }
      else {
        prefs.setString(KEEPMELOGGEDIN, null);
        prefs.setString(EMAIL, null);
        prefs.setString(PASSWORD, null);
      }
      http.Response secondLogin = await http.get(api.secondLogin, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      prefs.setString(USERDATA, secondLogin.body);
      prefs.setString(TOKEN, token);
      makeRoutePage(context: context, pageRef: HomeScreen());
    }else{
      prefs.setString(USERDATA, null);
      prefs.setString(TOKEN, null);
      prefs.setString(KEEPMELOGGEDIN, null);
    }
    return success;
  }catch(e){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Erro ao logar",
            ),
            content: Text("Informe ao desenvolvedor. Erro => $e"),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.pop(context);
//                  _tLogin.text = '';
//                  _tSenha.text = '';
//                  setState(() {
//                    _isLoading = false;
//                  });
                },
              )
            ],
          );
        }
    );
    return false;
  }

}