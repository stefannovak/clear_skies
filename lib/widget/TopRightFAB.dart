import 'package:flutter/material.dart';

class TopRightFAB extends StatelessWidget {
  const TopRightFAB({
    Key key,
  }) : super(key: key);

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
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
