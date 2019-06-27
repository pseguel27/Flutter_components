import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';

//import 'package:componentes/src/pages/home_temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; //Se utiliza para cambiar el idioma de la aplicacion

//inicializa proyecto y corre classe MyApp
void main() => runApp( MyApp() );
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes APP',
      localizationsDelegates: [ //Se utiliza para cambiar el idioma de la aplicacion
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [//Se utiliza para cambiar el idioma de la aplicacion
        const Locale('en', 'US'),
        const Locale('es', 'ES')
      ],
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