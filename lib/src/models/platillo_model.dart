import 'dart:convert';

Platillo platilloFromJson(String str) => Platillo.fromJson(json.decode(str));

String platilloToJson(Platillo data) => json.encode(data.toJson());

class Platillo {
    Platillo({
        this.id,
        this.nombre,
        this.descripcion,
        this.precioch,
        this.preciog,
        this.unitario,
        this.url,
        this.categoriaId,
        this.likes,
    });

    int id;
    String nombre;
    String descripcion;
    int precioch;
    int preciog;
    String unitario;
    String url;
    int categoriaId;
    int likes;

    factory Platillo.fromJson(Map<String, dynamic> json) => Platillo(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precioch: json["precioch"],
        preciog: json["preciog"],
        unitario: json["unitario"],
        url: json["url"],
        categoriaId: json["categoria_id"],
        likes: json["likes"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "precioch": precioch,
        "preciog": preciog,
        "unitario": unitario,
        "url": url,
        "categoria_id": categoriaId,
        "likes": likes,
    };
}
