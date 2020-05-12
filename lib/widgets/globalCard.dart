import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/utilities/style.dart';
import 'package:intl/intl.dart';

class GlobalCard extends StatefulWidget{
  final String title;
  final String type;
  final String iconType;
  final double value;

  const GlobalCard({
    Key key,
    this.title,
    this.type,
    this.iconType,
    this.value,
  }): super(key: key);
  @override
  _GlobalCardState createState() => _GlobalCardState();
}

class _GlobalCardState extends State<GlobalCard> {

  var f = new NumberFormat("###,###,###,###,##0.00", "pt_BR");
  bool showValue = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            leftSide(),
//            rightSide()
          ],
        ),
      )
    );
  }


  Widget leftSide() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.title,
              style: kTitleStyle
            ),
            SizedBox(height: 8.0,),
            Row(
              children: <Widget>[
                Text(
                  widget.type,
                  style: kSubtitleStyle,
                ),
                SizedBox(width: 14.0,),
                IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.cyan,
                    size: 35.0,
                  ),
                  onPressed: () {
                    setState(() {
                      showValue = !showValue;
                    });
                  },
                  tooltip: "Mostrar saldo",
                ),
              ],
            ),
            Text(
              "R\$ " + f.format(widget.value),
              style: showValue ? kSubtitleStyle : kHideSubtitleStyle
            ),
          ],
        ),
      ),
    );
  }

//  Widget rightSide() {
//    return Container(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.end,
//        children: <Widget>[
//          Row(
//            children: <Widget>[
//              Column(
//                children: <Widget>[
//                  Text(widget.bank),
//                  Text(widget.agency),
//                ],
//              ),
//            ],
//          ),
//        ],
//      ),
//    );
//  }
}