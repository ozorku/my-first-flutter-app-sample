import 'package:flutter/material.dart';
import 'balanceCard.dart';
import 'plansSection.dart';
import 'actionsSection.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('MY FLUTTER APP'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[BalanceCard(), PlansSection(), ActionsSection()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
//        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            title: Text('Plans'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline), title: Text('Actions')),
          new BottomNavigationBarItem(
            title: Text('Transactions'),
            icon: Icon(Icons.bookmark),
          ),
          new BottomNavigationBarItem(
            title: Text('Stash'),
            icon: Icon(Icons.casino),
          ),
        ],
        onTap: (index) {
          print(index);
        },
      ),
    );
  }
}
