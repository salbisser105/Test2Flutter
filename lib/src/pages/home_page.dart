import 'package:flutter/material.dart';
import 'package:test_2/src/pages/alert_page.dart';
import 'package:test_2/src/providers/menu_provider.dart';
import 'package:test_2/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
          );
        }
      //Ctrl + z helps you to have a good identation.
  Widget _list() {

    return FutureBuilder(
      future: menuProvider.loadData(),
      //initial data is not necessary 
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){

      return ListView(
        children: _listItems( snapshot.data, context),
      );

      },
    );

  

  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {

    final List<Widget> options = [];

    if (data == null ) { return []; }

    data.forEach((opt) { 

      final widgetTemp= ListTile(
        title: Text(opt['text']),
        leading: getIcon(opt['icon']),
        trailing : Icon(Icons.keyboard_arrow_right,  color: Colors.blue),
        onTap: () {
          
          Navigator.pushNamed(context,opt['route'] );
          
          //another way to use this routes will be put later(is the one used up)
          //final route = MaterialPageRoute(
            //builder: (context) => AlertPage(),
           // );
          //how to navigate into another page
          //Navigator.push(context, route);

        },

      );

      options..add( widgetTemp )
             ..add ( Divider() );

    });

    return options;

  }
}