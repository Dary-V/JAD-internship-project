import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About'), centerTitle: true, elevation: 2.0),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Text(
              'About JAD 3:20',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.network(
              'https://i.pinimg.com/originals/62/36/8b/62368ba55d3b80f943af862111f0e807.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Flex(direction: Axis.vertical, children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 16.0, left: 20.0, right: 20.0),
              child: Row(children: <Widget>[
                Expanded(
                child: Text('Etiam bibendum elit eget erat. '
                    'Nullam rhoncus aliquam metus. '
                    'Phasellus enim erat, vestibulum vel, aliquam a, posuere eu, velit. '
                    'Suspendisse sagittis ultrices augue. Fusce tellus. '
                    'Praesent in mauris eu tortor porttitor accumsan. '
                    'Etiam dui sem, fermentum vitae, sagittis id, malesuada in, quam. '
                    'In laoreet, magna id viverra tincidunt, sem odio bibendum justo, '
                    'vel imperdiet sapien wisi sed libero. '
                    '\n\n'
                    'Duis aute irure dolor in reprehenderit in voluptate velit '
                    'esse cillum dolore eu fugiat nulla pariatur. '
                    'Cras elementum. Integer pellentesque quam vel velit. '
                    'Curabitur ligula sapien, pulvinar a vestibulum quis, '
                    'facilisis vel sapien. In rutrum. Nullam sapien sem, '
                    'ornare ac, nonummy non, lobortis a enim.', style: TextStyle(fontSize: 18.0),),
              ),
    ]),
            ),
          ]),
        ],
      ),
    );
  }
}
