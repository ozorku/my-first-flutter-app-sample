import 'package:flutter/material.dart';


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