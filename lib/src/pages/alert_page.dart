import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),

      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Alert'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _showAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: (){
          Navigator.pop(context);
        }),
    );
  }


 void _showAlert(BuildContext context){
   showDialog(
     context: context,
     barrierDismissible: true,
     builder: (context) {
       //Creates the alert 
       return AlertDialog(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
         title: Text('Title'),
         content: Column(
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[
             Text('This is the alert message'),
             FlutterLogo(size:80.0)

           ],
         ),
         actions: <Widget>[
           FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
            ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Continue'),
            ),
         ],
       );
     }
    );
 }

}