import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),

      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
        ],
      ),
     );
   }
          
  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color : Colors.blue),
            title: Text('I am the title of this card'),
            subtitle: Text('description of the card.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('Accept'),
                onPressed: (){},
              )
          ],)
      ],
      ),
    );
  }

 Widget  _cardTipo2() {
   
   final card = Container(
     
     child: Column(
       children: <Widget>[
         //this lets you load an image using a URL. Placeholder is what you will show when loading .
         FadeInImage(
           placeholder: AssetImage('assets/jar-loading.gif'),
           image: NetworkImage('https://cdn.urlaubsguru.at/wp-content/uploads/2019/05/luzern-city-view-istock_23855240_xlarge-2-1.jpg'),
           fadeInDuration: Duration(milliseconds: 200),
           height: 300.0,
           fit: BoxFit.cover,
           ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Nothing to put here'),
          )
         
       ],
     ),
   );

   return Container(
     child: ClipRRect(
       child: card,
       borderRadius: BorderRadius.circular(20.0),
     ),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(20.0),
       boxShadow: <BoxShadow>[
         BoxShadow(
           color: Colors.blue,
           blurRadius: 10.0,
           spreadRadius: 2.0,
           offset: Offset(2.0,-5.0),
         ),
       ]
     ),
   );
 }
}