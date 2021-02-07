import 'package:flutter/material.dart';
import 'package:platillos/src/models/platillo_model.dart';
import 'package:platillos/src/services/platillos_service.dart';

class PlatillosProvider extends ChangeNotifier{
  List<Platillo> platillos;

  Future<List<Platillo>> obtenerPlatillos() async {

    if(this.platillos != null){
      return platillos;
    }

    var service = new PlatillosServices();
    this.platillos = await service.obtenerTodos();
    notifyListeners();
    return platillos;
  }

  Future<List<Platillo>> refreshPlatillos() async {
    var service = new PlatillosServices();
    this.platillos = await service.obtenerTodos();
    notifyListeners();
    return platillos;
  }
}