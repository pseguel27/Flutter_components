import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_providers.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

//import 'alert_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    //retorna un FutureBuilder
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [], //se carga mientras no sea resuelto el Future cargarData()
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot){

        return ListView(
          children: _listaItems( snapshot.data, context ),
        );

      },
    );

   
  }

  List<Widget>_listaItems( List<dynamic> data, BuildContext context ) {

    final List<Widget> opciones = [];

    data.forEach( (opt)  {

      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon( opt['icon'] ),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: (){

        Navigator.pushNamed( context, opt['ruta'] );

        //forma de navegar
        /*  final route = MaterialPageRoute(
            builder: ( context ) => AlertPage()
          );


          Navigator.push(context, route);*/

        },
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

    });

    return opciones;

  }


}