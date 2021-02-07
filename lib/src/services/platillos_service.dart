import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:platillos/src/global/environment.dart';
import 'package:platillos/src/models/platillo_model.dart';


class PlatillosServices {


  Future<List<Platillo>> obtenerTodos() async {
    final response = await http.get('${Environment.apiUrl}shop/make/show/product_by_category/1');

    if(response.statusCode == 200){
      final decoded = await json.decode(response.body);
      var lst = new List<Platillo>();
      for(var platillo in decoded['products']){
        var pl = new Platillo.fromJson(platillo);
        lst.add( pl );
      }
      return lst;

    }
    return [];

  }



}