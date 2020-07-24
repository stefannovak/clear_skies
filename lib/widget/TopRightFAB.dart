import 'package:flutter/material.dart';

class TopRightFAB extends StatelessWidget {
  TopRightFAB({@required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      //Top right FAB
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
          child: FloatingActionButton(
            backgroundColor: Color(0xFF2F3148),
            child: Text(
              "C/F",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: onTap,
          ),
        ),
      ],
    );
  }

  //DEPRECATED AS NOT IMPLEMENTING CITY SELECTOR
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      //Top right FAB
//      mainAxisAlignment: MainAxisAlignment.end,
//      children: <Widget>[
//        Container(
//          margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
//          child: FloatingActionButton(
//            backgroundColor: Color(0xFF2F3148),
//            child: Icon(Icons.add),
//            onPressed: onTap,
//          ),
//        ),
//      ],
//    );
//  }
}
