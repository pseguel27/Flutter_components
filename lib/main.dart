import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';

//import 'package:componentes/src/pages/home_temp.dart';
import 'package:flutter/material.dart';

//inicializa proyecto y corre classe MyApp
void main() => runApp( MyApp() );
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Componentes APP',
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
      //home:  HomePage(),
      initialRoute: '/',
      
      onGenerateRoute: ( RouteSettings settings ){ //rutas generadas dinamicamente
        return MaterialPageRoute(builder: ( context ) => AlertPage());
      },
    );
  }

}