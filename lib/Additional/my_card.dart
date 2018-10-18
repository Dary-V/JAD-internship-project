import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

double cardWidth = 110.0;

class MyCard extends StatelessWidget {
  final String title;
  final body;
  final int flexSize;
  final myOnTap;

  const MyCard(
      {Key key,
      @required this.title,
      @required this.body,
      @required this.flexSize,
      @required this.myOnTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexSize,
        child: Card(
            margin: EdgeInsets.all(4.0),
            child: InkWell(
              onTap: myOnTap,
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
              splashColor: Colors.lightBlue[100],
              child: SizedBox(
              height: 150.0,
              width: cardWidth,
              child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(6.0),
                      width: 500.0,
                      height: 100.0,
                      child: Image.asset(
                        title,
                        scale: 2.0,
                        width: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(body),
                    )
                  ],
                ),
            ),
          ),
        ),
    );
  }
}
