//This is the old version of home screen, it uses ListView as it`s layout

//import 'package:flutter/material.dart';
//import 'my_card.dart';
//import 'login_page.dart';
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//      return new Scaffold(
//        appBar: new AppBar(
//          elevation: 1.0,
//          title: new Text(widget.title),
//          actions: <Widget>[
//            FlatButton(
//              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => LoginPage()),
//                );
//              },
//              child: Text.rich(TextSpan(text: 'Sign in'),
//                  style: TextStyle(color: Colors.blue, fontSize: 18.0)),
//            )
//          ],
//        ),
//        body: SliverFixedExtentList(
//          itemExtent: 50.0,
//          delegate: new SliverChildBuilderDelegate(
//                (BuildContext context, int index) {
//              return new Container(
//                child: Column(
//                  children: <Widget>[
//                    Row(
//                      children: <Widget>[
//                        MyCard(
//                            title: 'Tadaam',
//                            body: 'Some plain text',
//                            flexSize: 1),
//                        MyCard(
//                            title: 'Let it work',
//                            body: 'Pleeeeeeeeeeeeeease',
//                            flexSize: 2),
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        MyCard(
//                            title: 'Tadaam',
//                            body: 'Some plain text',
//                            flexSize: 1),
//                        MyCard(
//                            title: 'Tadaam',
//                            body: 'Some plain text',
//                            flexSize: 1),
//                        MyCard(
//                            title: 'Tadaam',
//                            body: 'Some plain text',
//                            flexSize: 1),
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        MyCard(title: 'Title', body: 'Body', flexSize: 2),
//                        MyCard(
//                            title: 'Tadaam',
//                            body: 'Some plain text',
//                            flexSize: 1),
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        MyCard(
//                            title: 'Tadaam',
//                            body: 'Some plain text',
//                            flexSize: 1),
//                        MyCard(
//                            title: 'Tadaam',
//                            body: 'Some plain text',
//                            flexSize: 1),
//                        MyCard(
//                            title: 'Tadaam',
//                            body: 'Some plain text',
//                            flexSize: 1),
//                      ],
//                    ),
//                  ],
//                ),
//              );
//            },
//          ),
//        ),
//      );
//    }
//  }
//}
