import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 100.0;
  bool _lockcheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top:50.0),
        child: Column(
          children: <Widget> [
            _createSlider(),
            _checkBox(),
            _createSwitch(),
            Expanded(
              child: _createImage()
              ),

          ],
        ),
      ),
    );
  }

Widget _createSlider(){

  return Slider(
  activeColor: Colors.indigoAccent,
  label: 'Image Value',
  
  value: _sliderValue,
  min:10.0,
  max:400.0,
  //Evalues if lockcheck is true or false 
  onChanged: (_lockcheck ) ? null : (valuec) {
    setState(() {
      _sliderValue = valuec;
    });
  }
  );
}

Widget _createImage(){

  return Image(
    image: NetworkImage('https://depor.com/resizer/r0T8P_CTARwFSklfErBbkqp78iQ=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/LUIRD2X5JFE4DBG2PJVHRDOGA4.jpg'),
    width: _sliderValue,
    fit: BoxFit.contain,
  );

}

Widget _checkBox() {

// return Checkbox(
// value: _lockcheck,
// onChanged: (value){
// setState(() {
//   _lockcheck= value;
// });
// // },
// // );

return CheckboxListTile(
title: Text('Block Slider'),
value: _lockcheck,
onChanged: (value){
setState(() {
  _lockcheck= value;
}
);
},
);
}

Widget _createSwitch() {

return SwitchListTile(
title: Text('Block Slider'),
value: _lockcheck,
onChanged: (value){
setState(() {
  _lockcheck= value;
}
);
},
);

}

}