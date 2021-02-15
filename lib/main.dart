import 'package:flutter/material.dart';
import 'package:test_2/src/pages/alert_page.dart';
import 'package:test_2/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates:[
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('de', 'DE'),
        const Locale('es', 'ES'),
      ],
    
      //home: HomePage(),
      //We are going to enable the routes, giving us the chance to navigate.
      initialRoute: '/',
      routes:getApplicationRoutes() ,
      onGenerateRoute: (RouteSettings settings ){
        print( 'Ruta llamada: ${settings.name}');
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );

      },

    );
  }
}