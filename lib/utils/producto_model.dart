import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;


class Product {
  final int id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final String imageUrl;
  final String websiteUrl;
  final int rating;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.websiteUrl,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      websiteUrl: json['websiteUrl'],
      rating: json['rating'],
    );
  }
}


Future<List<Product>> fetchTop5Products() async {
  final response = await rootBundle.loadString('assets/productos/productos.json');
  final data = json.decode(response);
  final products = (data['products'] as List)
      .map((json) => Product.fromJson(json))
      .toList();
  
  // Ordenar los productos por calificación de forma descendente
  products.sort((a, b) => b.rating.compareTo(a.rating));

  // Tomar los primeros 5 productos de la lista ordenada
  return products.take(5).toList();
}

Future<List<Product>> fetchProductsByName(String name) async {
  final response = await rootBundle.loadString('assets/productos/productos.json');
  final data = json.decode(response);
  final products = (data['products'] as List)
      .map((json) => Product.fromJson(json))
      .toList();

  // Filtrar los productos por nombre
  return products.where((product) => product.name.toLowerCase().contains(name.toLowerCase())).toList();
}