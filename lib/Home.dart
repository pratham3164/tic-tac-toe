import 'package:flutter/material.dart';
import 'package:newapp/game.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyGame(false)));
                    print(' 1 tapped');
                  },
                  child: Text('Single Player'),
                  padding: EdgeInsets.all(20.0),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyGame(true)));
                    print(' 2 tapped');
                  },
                  child: Text('2 Players'),
                  padding: EdgeInsets.all(20.0),
                )),
          ],
        ));
  }
}
