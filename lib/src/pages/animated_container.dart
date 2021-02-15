import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
//Properties that i will use inside the container.
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.blueGrey;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration:  BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        ),
      ),

    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.play_arrow),
       onPressed: _changeShape,
             ),
       
           );
         }
       
    void _changeShape() {
      final random = Random();
      setState(() {     
      _width   = random.nextInt(150).toDouble();
      _height = random.nextInt(150).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255), 
        1);

        _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
        
      });


  }
}