import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

List<int> _numbersList = new List();
int _lastItem = 0;
bool _isLoading = false;

@override
void initState() {
  super.initState();
  _add10();

_scrollController.addListener(() {

  if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
    _add10();
    fetchData();
  }

 });

 @override
 void dispose() {
   super.dispose();
   _scrollController.dispose();
 }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
        )
      
      
    );
  }

  Widget _createList() {

    return RefreshIndicator(
        onRefresh: obtainPage1,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _numbersList.length,
        itemBuilder: (BuildContext context, int index){

          final imagen = _numbersList[index];

          return FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://picsum.photos/seed/picsum/500/300?image=$imagen'),

          );
        },
      
      ),
    );

  }
Future<Null> obtainPage1() async {

final duration = new Duration (seconds: 2);
new Timer (duration, (){
_numbersList.clear();
_lastItem ++;
_add10();
});

return Future.delayed(duration);

}

void _add10(){

for (var i = 0; i<10; i++){
_lastItem++;
_numbersList.add(_lastItem);
}

setState((){});

}

Future<Null> fetchData() async {

 _isLoading = true;
  setState(() {});

  final duration = new Duration(seconds : 2);
  return new Timer(duration, answerHTTP);

}

void answerHTTP(){

_isLoading = false;
_scrollController.animateTo(
_scrollController.position.pixels + 100, 
duration: Duration(milliseconds: 250), 
curve: Curves.fastOutSlowIn
);

_add10();

}
Widget _createLoading() {

  if (_isLoading) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator()
          ],
        ),
        SizedBox(height: 15.0)
      ],
    );
    
  }else {
    return Container();
  }

}

}