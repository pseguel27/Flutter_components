import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  //String _fecha= '';

  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 20 ),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context ),
          Divider(),
          _crearPersona(),
        ],
      ),

    );
  }

  Widget _crearInput(){

    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Cantidad de letras ${ _nombre.length }'), //texto inferior a input
        hintText: 'Nombre de la persona', //placeholder
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon( Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: ( valor ){
        setState(() {
          _nombre = valor;
        });

      },
    );

  }

  Widget _crearFecha( BuildContext context ){
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de nacimiento', //placeholder
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon( Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of( context ).requestFocus( new FocusNode() ); //quitar el focus
        _selectDate( context );
      },
    );
  }

  Widget _crearPersona(){
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email es: $_email'),
      
    );
  }

  _selectDate( BuildContext context ) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2015),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );

    if( picked != null){
      setState(() {
        
        DateTime now = DateTime.now();
        String _fecha = DateFormat('yyyy-MM-dd').format(now);
        _inputFieldDateController.text = _fecha;

      });
    } 

  }

  Widget _crearEmail(){
  
    return TextField(
      keyboardType: TextInputType.emailAddress, //mostrar arroba en primera pagina
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Email', //placeholder
        labelText: 'Email',
        suffixIcon: Icon( Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: ( valor ) => setState(() {
          _email = valor;
        })
    );

  }

  Widget _crearPassword(){

    return TextField(
      obscureText: true, //para ocultar el password
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Password', //placeholder
        labelText: 'Password',
        suffixIcon: Icon( Icons.lock),
        icon: Icon(Icons.lock),
      ),
      onChanged: ( valor ) => setState(() {
          //_password = valor;
        })
    );

  }

}