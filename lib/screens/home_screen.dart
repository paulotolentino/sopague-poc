import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/utilities/CreateAPI.dart';
import 'package:flutter_login_ui/utilities/UserData.dart';
import 'package:flutter_login_ui/utilities/constants.dart';
import 'package:flutter_login_ui/utilities/globalFunctions.dart';
import 'package:flutter_login_ui/widgets/globalCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  UserData userData;
  bool loading;
  bool notifications;
  int _currentIndex;
  List<Widget> _children;
  var _api = new CreateAPI();

  @override
  void initState(){
    super.initState();
    setState(() {
      loading = true;
      _currentIndex = 0;
//      _children = [content(),content(),content(),content()];
    });
    getLoginData();
    Timer(Duration(seconds: 2), () => setState(() {
      loading = false;
    }));
  }

  void getLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userDataSaved = prefs.getString(USERDATA);
    final String token = prefs.getString(TOKEN);
    if(userDataSaved !=  null){
      try{
        http.Response _notifications = await http.get(_api.getNotifications, headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
        setState(() {
          userData = UserData.fromJson(jsonDecode(userDataSaved));
          notifications = json.decode(_notifications.body)[DATA][NOTIFY].length > 0;
        });
      }
      catch(e){
        print("Erro => $e");
        logOut(context);
      }
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if(index == 3){
      logOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Stack(
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
                      Center(
                        child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),),
                      )
                    ],
                  ),
                )
            )
        )
      ],
    ) : Scaffold(
      body: Stack(
        children: <Widget>[dashBg(), content()]
//            : _children[_currentIndex] ,
//            : <Widget>[dashBg(), _children[_currentIndex]]

      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text(
              "Corrente",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_made),
            title: Text("Investimentos"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text("Menu/Sair"),
          ),
        ],
      ),
    );
  }

  Widget dashBg() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(decoration: BoxDecoration(
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
          ),),
          flex: 2,
        ),
        Expanded(
          child: Container(color: Color.fromRGBO(172, 203, 252, 0.4)),
          flex: 7,
        ),
      ],
    );
  }

  Widget content() {
    return Container(
      child: Column(
        children: <Widget>[
          header(),
          grid(),
        ],
      ),
    );
  }

  Widget header() {
    return  Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/12, left: 16.0, right: 16.0, bottom: MediaQuery.of(context).size.width/50),
      height: MediaQuery.of(context).size.width/3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.network(
                "https://app.sopague.com/assets/app-assets/tela-login/images/logo-pague-white.png",
                width: MediaQuery.of(context).size.width/2,
              ),
              Text(
                "Olá, " + userData.user.name + "!",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ],
          ),
          SizedBox(width: 10.0,),
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 32.0,
                ),
                onPressed: (){},
              ),
              notifications ? Positioned(
                top: 6.0,
                left: 24.0,
                child: Stack(
                  children: <Widget>[
                    Icon(Icons.brightness_1,
                        size: 12.0, color: Colors.red),
                  ],
                ),
              ): Container()
            ],
          )
        ],
      ),
    );
//      ListTile(
//        contentPadding: EdgeInsets.only(
//            left: 20, right: 20, top: 20, bottom: 12.0),
//        title: Container(
//          padding: EdgeInsets.only(top: 16.0),
//          child: Image.network(
//            "https://app.sopague.com/assets/app-assets/tela-login/images/logo-pague-white.png",
////            width: 10,
//          ),
//        ),
//        subtitle: Text(
//          "Olá, " + userData.user.name + "!",
//          style: TextStyle(color: Colors.white, fontSize: 16.0),
//        ),
//        trailing: Container(
//          padding: EdgeInsets.only(left: 50.0, top: 10.0),
//          child: Stack(
//            children: <Widget>[
//              IconButton(
//                icon: Icon(
//                  Icons.notifications,
//                  color: Colors.white,
//                  size: 32.0,
//                ),
//                onPressed: (){},
//              ),
//              Positioned(
//                top: 6.0,
//                left: 24.0,
//                child: Stack(
//                  children: <Widget>[
//                    Icon(Icons.brightness_1,
//                        size: 12.0, color: Colors.red),
//                  ],
//                ),
//              )
//            ],
//          )
//        ),
//        Container(
//          width: 150.0,
//          padding: EdgeInsets.only(left: 50.0, top: 20.0),
//          child: FlatButton(
//            child: Text("Sair",
//              style: TextStyle(color: Colors.white, fontSize: 15.0),),
//            onPressed: () => logOut(context),
//          ),
//        )
//    );
  }

  Widget grid() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
        child: GridView.count(
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 1,
          childAspectRatio: 2.3,
          children: [
            GlobalCard(
              title: "Conta-Corrente",
              type: "Saldo em conta",
              iconType: "Seta",
              value: userData.user.balance.real,
            ),
            GlobalCard(
              title: "Conta-Investimento",
              type: "Saldo em conta",
              iconType: "Seta",
              value: 0,
            ),
          ]
//            userData.user.myBanks.map((MyBanks data) {
//              return GlobalCard(
//                title: data.typeAccount,
//                type: "Saldo em conta",
//                iconType: "Seta",
//                eye: true,
//                bank: data.name,
//                agency: data.agency+"/"+data.account,
//                value: 0.0,
//              );
//            }).toList()

//          List.generate(3, (_) {
//            return GlobalCard(
//              title: "Conta Corrente",
//              type: "Saldo em conta",
//              iconType: "Seta",
//              eye: true,
//              bank: "Banco 123",
//              agency: "12345-6",
//              value: 100.00,
//            );
//          }),
        ),
      ),
    );
  }
}
