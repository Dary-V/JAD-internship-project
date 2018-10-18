import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2.0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('events').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return new Center(child: CircularProgressIndicator());
          return new ListView(
//            itemExtent: 400.0,
//            cacheExtent: 200.0,
            scrollDirection: Axis.vertical,

//            shrinkWrap: true,
            //reverse: true,
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return new Column(
                children: <Widget>[
                  EventCard(
                    title: document['title'],
                    date: document['date'].toString(),
                    location: document['location'],
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

class EventCard extends StatelessWidget {
  final date;
  final title;
  final location;

  const EventCard(
      {Key key,
      @required this.title,
      @required this.date,
      @required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black38, width: 1.5)),
                ),
                child: Row(children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 6.0),
                    child: Icon(
                      Icons.date_range,
                      color: Colors.blue,
                      size: 28.0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      this.title,
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 6.0),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.black38,
                      size: 18.0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      this.location,
                      style: TextStyle(color: Colors.black45, fontSize: 20.0),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 8.0,
                ),
                Row(children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 6.0),
                    child: Icon(
                      Icons.access_time,
                      color: Colors.black38,
                      size: 18.0,
                    ),
                  ),
                  Text(
                    this.date,
                    style: TextStyle(color: Colors.black45, fontSize: 16.0),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
