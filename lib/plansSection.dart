import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'plan.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final double balance;

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
