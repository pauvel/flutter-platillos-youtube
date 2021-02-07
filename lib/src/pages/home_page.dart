import 'package:flutter/material.dart';
import 'package:platillos/src/models/platillo_model.dart';
import 'package:platillos/src/providers/platillos_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Platillos'),
      ),
      body: _body()
    );
  }

  Widget _body(){
    return Column(
      children: [
        Flexible(
          child: _listaPlatillos(),
        )
      ],
    );
  }

  Widget _listaPlatillos() {
    final platilloProvider = Provider.of<PlatillosProvider>(context);

    return FutureBuilder(
      future: platilloProvider.obtenerPlatillos(),
      builder: (_, AsyncSnapshot<List<Platillo>> snapshot){
        if(snapshot.hasData){
          final platillos = snapshot.data;

          return ListView.builder(
            itemCount: platillos.length,
            itemBuilder: (_, int i){
              return _card(platillos[i]);
            },
          );
        }else{
          return Center(
            child: CircularProgressIndicator()
          );
        }
      },
    );
  }

  Widget _card(Platillo platillo) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(platillo.nombre),
        subtitle: Text(platillo.descripcion),
        leading: Image.network(platillo.url),
      ),
    );
  }
}