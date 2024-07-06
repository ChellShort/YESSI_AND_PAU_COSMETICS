import 'package:flutter/material.dart';

class details_Custom extends StatefulWidget {
  final String image;
  const details_Custom({super.key, required this.image});

  @override
  State<details_Custom> createState() => _details_CustomState();
}

class _details_CustomState extends State<details_Custom> {
  @override
  Widget build(BuildContext context) {
    String image = 'assets/${widget.image}.png';
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
            Image.asset(image),
            const SizedBox(height: 16.0),
            const Text(
              'Producto de belleza',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Este es un prudcto de belleza que te hará lucir radiante y hermosa. ¡Cómpralo ya!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16.0),
            const Text(
              '4000.00 MXN',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón de comprar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Producto añadido al carrito')),
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
