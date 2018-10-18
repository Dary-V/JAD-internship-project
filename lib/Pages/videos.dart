import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'testimonies.dart';

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos'),
        centerTitle: true,
        elevation: 2.0,
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('videos').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return new Center(child: CircularProgressIndicator());
          return new ListView(
            scrollDirection: Axis.vertical,
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return new Column(
                children: <Widget>[
                  VideoCard(
                    title: document['title'],
                    youtubeID: document['youtubeID'],
                    createdAt: document['created_at'].toString(),
                    category: document['category'],
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

class VideoCard extends StatelessWidget {
  final category;
  final youtubeID;
  final title;
  final createdAt;

  const VideoCard(
      {Key key,
      @required this.category,
      @required this.title,
      @required this.youtubeID,
      @required this.createdAt});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10.0, bottom: 6.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              return launchURL(
                  'https://www.youtube.com/watch?v=' + this.youtubeID);
            },
            child: Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(8.0),
              child: Image.network(
                'https://media-cdn.tripadvisor.com/media/photo-s/01/2d/f6/18/june-sunset-from-senja.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flex(direction: Axis.vertical, children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                    Expanded(
                      child: Text(
                        this.title + ' | ' + this.category,
                        style: TextStyle(color: Colors.black, fontSize: 22.0),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 4.0),
                      child: Icon(
                        Icons.date_range,
                        color: Colors.black26,
                        size: 17.0,
                      ),
                    ),
                    Text(
                      this.createdAt,
                      style: TextStyle(color: Colors.black26, fontSize: 14.0),
                    ),
                  ]),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
