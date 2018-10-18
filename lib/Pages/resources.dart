import 'package:flutter/material.dart';
import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';

class ResourcesPage extends StatefulWidget {
  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: FlatButton(
                    onPressed: () {},
                    child: Text('Videos'),
                  ),
                ),
                Flexible(
                  child: FlatButton(
                      onPressed: () => FlutterPdfViewer
                          .loadAsset('assets/jad_cards/Estonia.pdf'),
                      child: Text('Cards')),
                ),
                Flexible(
                  child: FlatButton(onPressed: () {}, child: Text('Booklet')),
                ),
                Flexible(
                  child:
                      FlatButton(onPressed: () {}, child: Text('Wallpapers')),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[Container(color: Colors.lightBlueAccent[100])],
            ),
          ]),
    );
  }
//  Widget loadPdf(){
//    return Container(child: Uri.file(path)
//  }
}
