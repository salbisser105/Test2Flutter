import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pinimg.com/originals/9f/3c/60/9f3c60624ff234712e5d9675b18e346c.jpg'),
              radius: 30.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right:10.0),
            child: CircleAvatar(
              child:Text('OD'),
              backgroundColor: Colors.brown,
              ),
          )
        ],
        
      ),
      body: Center(
        child: FadeInImage(placeholder:AssetImage('assets/jar-loading.gif') ,
        image: NetworkImage('https://wallpapercave.com/wp/wp2365282.jpg'),
         fadeInDuration: Duration(milliseconds: 200),
         ),
      ),
    );
  }
}