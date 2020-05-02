import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      margin: EdgeInsets.only(bottom: 50, top: 20, left: 20, right: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey[400],
          blurRadius: 10.0, // has the effect of softening the shadow
          spreadRadius: 1.0, // has the effect of extending the shadow
          offset: Offset(
            1.0, // horizontal, move right 10
            1.0, // vertical, move down 10
          ),
        ),
      ], color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        children: <Widget>[
          Text(
            'TOTAL BALANCE',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '404,329',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
