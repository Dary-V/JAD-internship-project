import 'package:flutter/material.dart';
import 'testimonies.dart';

class SocialMediaLinks extends StatefulWidget {
  @override
  _SocialMediaLinksState createState() => _SocialMediaLinksState();
}

class _SocialMediaLinksState extends State<SocialMediaLinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Social'),
        backgroundColor: Colors.white,
        elevation: 0.0,),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: (){return launchURL('https://www.facebook.com/JesusAtTheDoor/');},
            leading: Container(width: 60.0, child: Image.asset('assets/icons/facebook_icon.png', fit: BoxFit.cover,),),
            title: Text('Follow on Facebook', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            subtitle: Text('Latest updates'),
          ),
          ListTile(
            onTap: (){return launchURL('https://mobile.twitter.com/JesusAtTheDoor');},
            leading: Container(width: 60.0, child: Image.asset('assets/icons/twitter_icon.png', fit: BoxFit.cover,),),
            title: Text('Follow on Twitter', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            subtitle: Text('Fresh thoughts'),
          ),
          ListTile(
            onTap: (){return launchURL('https://m.youtube.com/channel/UCRXCRtLa4drEGyvr_7LmEGw');},
            leading: Container(width: 60.0, child: Image.asset('assets/icons/youtube_icon.png', fit: BoxFit.cover,),),
            title: Text('Follow on Youtube', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            subtitle: Text('Watch christian videos'),
          ),
          ListTile(
            onTap: (){return launchURL('https://www.instagram.com/JesusAtTheDoor/');},
            leading: Container(width: 60.0, child: Image.asset('assets/icons/instagram_icon.png', fit: BoxFit.cover,),),
            title: Text('Follow on Instagram', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            subtitle: Text('Photos from latest events'),
          ),
        ],
      ),
    );
  }
}
