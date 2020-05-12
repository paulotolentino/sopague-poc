import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/utilities/UserData.dart';
import 'package:flutter_login_ui/utilities/globalFunctions.dart';

class Header extends StatefulWidget {
  final UserData userData;
  const Header({Key key, this.userData}): super(key: key);
  @override
  HeaderState createState() => HeaderState();
}

class HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.only(
            left: 20, right: 20, top: 20, bottom: 16.0),
        title: Container(
          padding: EdgeInsets.only(top: 16.0),
          child: Image.network(
            "https://app.sopague.com/assets/app-assets/tela-login/images/logo-pague-white.png",
            width: 10,
          ),
        ),
        subtitle: Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            "Olá, " + widget.userData.user.name + ".",
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
        trailing: Container(
          width: 150.0,
          padding: EdgeInsets.only(left: 50.0, top: 20.0),
          child: FlatButton(
            child: Text("Sair",
              style: TextStyle(color: Colors.white, fontSize: 15.0),),
            onPressed: () => logOut(context),
          ),
        )
    );
  }

}