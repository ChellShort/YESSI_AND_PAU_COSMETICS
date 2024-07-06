import 'package:flutter/material.dart';
import 'counter.dart';

class cartScreen extends StatelessWidget {
  // Lista de productos con sus detalles (nombre, marca, precio)
  final List<Map<String, dynamic>> products = [
    {'name': 'Brillo Labial', 'brand': 'Bissu', 'price': 56.0, 'image': 'assets/BrilloBissu1.jpg'},
    {'name': 'Revlon Super Lustrous Labial', 'brand': 'Revlon', 'price': 117.0, 'image': 'assets/LabialRevlon1.jpg'},
    {'name': 'Sombra de ojos', 'brand': 'Mac', 'price': 459.0, 'image': 'assets/SombraOjosMate1.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    // Define a TextStyle for the titles
    final titleStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    // Calcula la suma de los precios parciales
    double totalPrice = products.fold(0, (sum, item) => sum + item['price']);

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
      ),
      body: Container(
        color: Colors.white, // Set the background color to white
        child: Column(
          children: [
            // Container with height of 50 pixels containing the row
            Container(
              height: 50,
              margin: EdgeInsets.all(4.0),
              color: Color.fromARGB(255, 172, 154, 212),
              child: Row(
                children: [
                  Expanded(
                    child: Center(child: Text('Producto', style: titleStyle)),
                  ),
                  SizedBox(width: 8), // SizedBox to create space between columns
                  Expanded(
                    child: Center(child: Text('Marca', style: titleStyle)),
                  ),
                  SizedBox(width: 8), // SizedBox to create space between columns
                  Expanded(
                    child: Center(child: Text('Total', style: titleStyle)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8), // SizedBox to create space between first and third spaces
            // ListView to display products dynamically
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var product = products[index];
                  return Container(
                    height: 100,
                    color: Colors.lightBlue,
                    margin: EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            color: Colors.white,
                            child: Image.asset(product['image']), // Replace with your small photo widget
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                product['name'], // Product name
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                product['brand'], // Product brand
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                'Total: \$${product['price'].toStringAsFixed(2)}', // PARTIAL PRICE
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Total price and pay button
            Container(
              margin: EdgeInsets.all(4.0),
              color: Color.fromARGB(255, 172, 154, 212),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Total: \$${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción del botón PAGAR
                    },
                    child: Text('PAGAR'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}