import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  
  final options = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Home Temp'),
      ),
      body: ListView(
        children: _createItemsShort(),
      ),
    );
  }

  //2 Different ways to create a list
  List<Widget> _createItems(){

    List<Widget> list = new List<Widget> ();
    
    for (var opt in options) {

      final tempWidget = ListTile(
        title: Text( opt ),

      );
    
      list..add ( tempWidget)
           ..add( Divider() );
      
    }

    return list;

  }

  List<Widget> _createItemsShort(){
    return  options.map( (item) {
      
      return Column(
        children: <Widget>[
          ListTile( 
            title: Text(item + '!'),
            subtitle: Text('basic test'),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
        ],
      );

    }).toList();
  }

}