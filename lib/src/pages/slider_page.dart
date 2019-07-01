import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 300.0;
  bool _blockearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only( top: 50.0 ), //padding para texto al presionar
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        )
      ),
    );
  }

  Widget _crearSwitch(){
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      onChanged: ( valor ){
        setState(() {
          _blockearCheck = valor;          
        });
      },
      value: _blockearCheck,
    );
  }

  Widget _crearCheckbox(){

    /*return Checkbox(
      onChanged: ( valor ){
        setState(() {
          _blockearCheck = valor;          
        });
      },
      value: _blockearCheck,
    );*/

    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      onChanged: ( valor ){
        setState(() {
          _blockearCheck = valor;          
        });
      },
      value: _blockearCheck,
    );

  }

  Widget _crearImagen(){

    return Image(
      image: NetworkImage('https://i.blogs.es/30eda0/cartel-batman-la-broma-asesina/450_1000.jpeg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }

Widget _crearSlider(){

  return Slider(
    activeColor: Colors.indigo,
    label: 'Tamaño de la imagen',
    //divisions: 20, //numero de divisiones para slider
    value: _valorSlider,
    min: 10.0,
    max: 400.0,
    onChanged: (_blockearCheck ) ? null : ( valor ){ //expresion ternaria opara evaluacion de check
      setState(() {
        _valorSlider = valor;        
      });
    },
  );
}

}