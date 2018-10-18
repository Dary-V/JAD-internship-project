//import 'package:flutter/material.dart';
//import 'package:jad_app/Additional/my_card.dart';
//import 'package:jad_app/main/login_page.dart';
//import 'package:jad_app/Pages/testimonies.dart';
//import 'package:jad_app/Pages/social.dart';
//import 'package:jad_app/Pages/events.dart';
//import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';
//import 'package:jad_app/Pages/videos.dart';
//import 'package:jad_app/Pages/about.dart';
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
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        elevation: 1.0,
//        title: new Text(widget.title),
//        centerTitle: true,
//        actions: <Widget>[
//          FlatButton(
//              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => Register()),
//                );
//              },
//              child: Text.rich(TextSpan(text: 'Sign in'),
//                  style: TextStyle(color: Colors.blue, fontSize: 18.0))
//
//          ),
//        ],
//      ),
//      body: CustomScrollView(
//        scrollDirection: Axis.vertical,
//        slivers: <Widget>[
//          new SliverFixedExtentList(
//            itemExtent: 650.0,
//            delegate: SliverChildListDelegate([
//              new Container(
//                padding: EdgeInsets.all(8.0),
//                child: Column(
//                  children: <Widget>[
//                    Row(
//                      children: <Widget>[
//                        MyCard(
//                          title: 'assets/icons/testimonies.png',
//                          body: 'Testimonies',
//                          flexSize: 1,
//                          myOnTap: (){
//                            Navigator.push(context,
//                              MaterialPageRoute(builder: (context) => TestimoniesPage()),);},
//                        ),
//                        MyCard(
//                          title: 'assets/icons/jad_card.png',
//                          body: 'JAD Card',
//                          flexSize: 2,
//                          myOnTap: ()=>FlutterPdfViewer.loadAsset('assets/jad_cards/Estonia.pdf'),
//
//                        ),
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        MyCard(
//                          title: 'assets/icons/shop.png',
//                          body: 'Shop',
//                          flexSize: 1,
//                          myOnTap: (){return launchURL('https://www.jesusatthedoor.com/shop/');},
//                        ),
//                        MyCard(
//                          title: 'assets/icons/resources.png',
//                          body: 'Resources',
//                          flexSize: 1,
//                          myOnTap: (){print('something');},
//                        ),
//                        MyCard(
//                          title: 'assets/icons/events.png',
//                          body: 'Events',
//                          flexSize: 1,
//                          myOnTap: (){
//                            Navigator.push(context,
//                              MaterialPageRoute(builder: (context) => Events()),);},
//                        ),
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        MyCard(
//                          title: 'assets/icons/video.png',
//                          body: 'Videos',
//                          flexSize: 2,
//                          myOnTap: (){Navigator.push(context,
//                            MaterialPageRoute(builder: (context) => VideoList()),);},
//                        ),
//                        MyCard(
//                          title: 'assets/icons/socials.png',
//                          body: 'Socials',
//                          flexSize: 1,
//                          myOnTap: (){
//                            Navigator.push(context,
//                              MaterialPageRoute(builder: (context)=>SocialMediaLinks()),);},
//                        ),
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        MyCard(
//                          title: 'assets/icons/about.png',
//                          body: 'About',
//                          flexSize: 1,
//                          myOnTap: (){
//                            Navigator.push(context,
//                              MaterialPageRoute(builder: (context)=>AboutPage()),);
//                          },
//                        ),
//                        MyCard(
//                          title: 'assets/icons/subscribe.png',
//                          body: 'Subscribe',
//                          flexSize: 1,
//                          myOnTap: (){print('something');},
//                        ),
//                        MyCard(
//                          title: 'assets/icons/give.png',
//                          body: 'Give',
//                          flexSize: 1,
//                          myOnTap: (){return launchURL('https://www.jesusatthedoor.com/donate/');},
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//            ]),
//          ),
//        ],
//      ),
//    );
//  }
//}




