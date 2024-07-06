import 'package:flutter/material.dart';
import 'counter.dart';

class cartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define a TextStyle for the titles
    final titleStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
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
            // Light blue space with height of 100 pixels and two columns
            Container(
              height: 100,
              color: Colors.lightBlue,
              margin: EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      color: Colors.white,
                      child: Image.asset('assets/logo.png'), // Replace with your small photo widget
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'Text in the second column',
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
            ),
            // Add the ProductCounter widget here
            ProductCounter(inventory: 100), // Replace 10 with your actual inventory count
            // Remaining 2 spaces
            ...List.generate(2, (index) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.all(4.0), // Optional: add margin to separate the spaces
                  color: Colors.grey[300], // Optional: set a color for visibility
                  child: Center(
                    child: Text('Space ${index + 3}'),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}