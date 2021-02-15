import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name  = '';
  String _email = '';
  String _password = '';
  String _date = '';

  String _selectedOption = 'Fly';

  List<String> _powers = ['Fly', 'Super Strength', 'X Ray', 'Super Speed'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Inputs')
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children:<Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
           Divider(),
          _createDropDown(),
           Divider(),
          _createPerson(),
         
        ],
      ),
    );
  }

 Widget _createInput() {
   //Text field works as independent
   return TextField(
    // autofocus: true, --> if you want to focus the text input at the moment you enter the page.
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
        ),
      counter: Text('Letters ${_name.length }'),
      hintText: 'Name of the person',
      labelText: 'Name',
      helperText: 'Only the Name',
      suffixIcon: Icon( Icons.accessibility),
      icon: Icon( Icons.account_circle),
    ),
   //there are different options to do here
   onChanged: (valor){ 
     //Remember use the set state to keep the information updated 
     setState(() {
       _name = valor;
     });
   },
   );
 }



Widget _createPerson(){
  return ListTile(
    title: Text('Name is: $_name'),
    subtitle: Text('Email: $_email'),
    trailing: Text(_selectedOption),

  );
}

Widget _createEmail() {
   return TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
        ),
      hintText: 'Email of the person',
      labelText: 'Email',
      suffixIcon: Icon( Icons.alternate_email),
      icon: Icon( Icons.email),
    ),
   //there are different options to do here
   onChanged: (valor){ 
     //Remember use the set state to keep the information updated 
     setState(() {
       _email = valor;
     });
   },
   );
}

List<DropdownMenuItem<String>> getOptionsDropDown() {

List<DropdownMenuItem<String>> lista = new List();

_powers.forEach((power) {
  lista.add(DropdownMenuItem(
    child: Text(power),
    value: power,
  ));
 });

return lista;

}

Widget _createDropDown() {

return Row(
  children: <Widget> [
  Icon(Icons.select_all),
  SizedBox(width: 30.0),
  Expanded(
    child: DropdownButton(
    value: _selectedOption,
    items: getOptionsDropDown(), 
    onChanged: (opt){
     setState(() {
       _selectedOption = opt;

     });
    },
    ),
  )
  ],
);



}

Widget _createPassword() {
   return TextField(
    obscureText: true,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
        ),
      hintText: 'Password of the person',
      labelText: 'Password',
      suffixIcon: Icon( Icons.lock_open),
      icon: Icon( Icons.lock),
    ),
   //there are different options to do here
   onChanged: (valor){ 
     //Remember use the set state to keep the information updated 
     setState(() {
       _password = valor;
     });
   },
   );
}

Widget _createDate(BuildContext context) {
  return TextField(
    enableInteractiveSelection: false,
    controller: _inputFieldDateController,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
        ),
      hintText: 'Born date',
      labelText: 'Born date',
      suffixIcon: Icon( Icons.perm_contact_calendar),
      icon: Icon( Icons.calendar_today),
    ),
   //there are different options to do here
   onTap: (){

     FocusScope.of(context).requestFocus(new FocusNode());
     _selectDate(context);

   },
   );
}

_selectDate (BuildContext context)async {

  DateTime picked = await showDatePicker(
    context: context,
    initialDate: new DateTime.now(),
    firstDate: new DateTime(1990),
    lastDate: new DateTime(2025),
    //Datepicker language
    locale: Locale('de', 'DE'),
    );

  if (picked!= null){
    setState(() {
      _date = picked.toString();
      _inputFieldDateController.text = _date;
    });
  }

}

}