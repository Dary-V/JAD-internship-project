import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:jad_app/main/database.dart';

class TestimoniesPage extends StatefulWidget {
  @override
  _TestimoniesPageState createState() => _TestimoniesPageState();
}

// >>>>>>>>> This stuff creates a list of cards with testimonies <<<<<<<<<<

class _TestimoniesPageState extends State<TestimoniesPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Testimonies'),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateTestimony()),
                );
              }),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('cards').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return new Center(child: CircularProgressIndicator());
          return new ListView(
            scrollDirection: Axis.vertical,
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return new Column(
                children: <Widget>[
                  MyTastyCard(
                    author: document['author'],
                    body: document['body'],
                    created_at: document['created_at'],
                  ),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}


// >>>>>>>>>> And this stuff describes one testimony card <<<<<<<<<<

class MyTastyCard extends StatelessWidget {
  final String author;
  final body;
  final created_at;

  const MyTastyCard({
    Key key,
    @required this.author,
    @required this.body,
    @required this.created_at,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(6.0),
            child: Text(
              author,
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              body,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(5.0),
            child: Text(
              created_at.toString(),
              style: TextStyle(color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }
}

var testimonyController = TextEditingController();

class CreateTestimony extends StatefulWidget {
  @override
  _CreateTestimonyState createState() => _CreateTestimonyState();
}

class _CreateTestimonyState extends State<CreateTestimony> {
  @override
  void initState() {
    testimonyController.clear();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Your Testimony'),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Here should be Username',
            style: TextStyle(color: Colors.black45, fontSize: 20.0),
          ),
        ),
        SizedBox(height: 10.0),
        Container(padding: EdgeInsets.all(13.0),
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Container(decoration: BoxDecoration(border: Border.all(color: Colors.lightBlue[300])), child: TextFormField(maxLines: 15,
            controller: testimonyController,
            enabled: true,
          ),
          ),
        ]),
        ),
        RaisedButton(
          splashColor: Colors.lightBlue,
          elevation: 4.0,
          color: Colors.white70,
          shape: StadiumBorder(side: BorderSide.lerp(BorderSide(color: Colors.white70), BorderSide(color: Colors.white70), 2.0)),
          onPressed: () {
            Navigator.pop(context);
            MyDatabase().createTestimony(
              'Author',
              testimonyController.text,
              testyDate,
            );
          },
          child: Text('Save'),
        ),

      ]),
    );
  }
}

DateTime testyDate = _getDateNow();

DateTime _getDateNow() {
  var now = new DateTime.now();
//  var formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
  return now;
}

launchURL(String link) async {
  final url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
