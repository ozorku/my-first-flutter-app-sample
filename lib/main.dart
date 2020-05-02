import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'plans.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ),
);

class BalanceCard extends StatelessWidget {
//  PlansSection totalBalance = new PlansSection();
//  totalBalance.total();

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

class PlanCard extends StatelessWidget {
  String title;
  double balance;

  PlanCard(this.title, this.balance);

  @override
  Widget build(BuildContext context) {
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: balance);
    MoneyFormatterOutput fo = fmf.output;

    return Container(
      margin: EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
      width: 230.0,
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 300,
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1,
                        color: Colors.grey[400],
                        style: BorderStyle.solid))),
            child: Text(
              '$title',
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text('Balance'),
                        ),
                        Container(
                          child: Text(
                            fo.withoutFractionDigits,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: Text('Interest p.a.'),
                        ),
                        Container(
                          child: Text('10%',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 4.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                1.0, // horizontal, move right 10
                1.0, // vertical, move down 10
              ),
            ),
          ],
          border: Border.all(
              width: 1, style: BorderStyle.solid, color: Colors.grey[400]),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
}

class PlansSection extends StatelessWidget {
  List<Plan> plans = [
      Plan('Accomodation', 201820.0),
      Plan('Regular Savings', 12820.0),
      Plan('Chop Life', 102324.0),
  ];


  double total() {
    double sum = 0;
    plans.forEach((plan) {
      sum += plan.balance;
    });
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text('PLANS'),
            margin: EdgeInsets.only(bottom: 2, left: 20),
          ),
          LimitedBox(
            maxHeight: 150,
            child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: plans.map((plan) {
                  return Container(
                    child: PlanCard(plan.title, plan.balance),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}

class ActionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text('ACTIONS'),
            margin: EdgeInsets.only(bottom: 2, left: 20),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: <Widget>[
                Container(
                  constraints: new BoxConstraints.expand(
                    height: 230.0,
                  ),
                  alignment: Alignment.bottomLeft,
                  child: Center(
                    child: Text(
                      'Hello',
                      style: new TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage(
                          'images/SamSpratt_Logic_Everybody_AlbumCover_FinalCrop_1080_V1.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

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
