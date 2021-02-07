import 'package:flutter/material.dart';
import 'package:platillos/src/pages/home_page.dart';
import 'package:platillos/src/providers/platillos_provider.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => PlatillosProvider() )
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: '/',
        routes: {
          '/': (_) => HomePage()
        },
      ),
    );

  }
  
}