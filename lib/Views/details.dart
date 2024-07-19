import 'package:flutter/material.dart';

class details_Custom extends StatefulWidget {
  final String image;
  final String nombreProducto;
  final String descripcionProducto;
  final double precioProducto;
  const details_Custom({super.key, required this.image, required this.nombreProducto, required this.descripcionProducto, required this.precioProducto});

  @override
  State<details_Custom> createState() => _details_CustomState();
}

class _details_CustomState extends State<details_Custom> {
  @override
  Widget build(BuildContext context) {
    String image = widget.image;
    String precio = '\$${widget.precioProducto} MXN';
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'YESSI & PAU',
            style: TextStyle(fontSize: 30),
          ),
          backgroundColor: const Color.fromARGB(255, 244, 152, 157),
        ),
        body:
            // Sección de detalles del producto (imagen, nombre, descripción, precio y botón de compra
            ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Image.network(image),
            const SizedBox(height: 16.0),
            Text(
              widget.nombreProducto,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.descripcionProducto,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16.0),
            Text(
              precio,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón de comprar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Producto ${widget.nombreProducto} añadido al carrito')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 244, 152, 157),
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
              ),
              child:
                  const Text('Comprar Ahora', style: TextStyle(fontSize: 18)),
            ),
          ],
        ));
  }
}
