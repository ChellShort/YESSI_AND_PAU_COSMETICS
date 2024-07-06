import 'package:flutter/material.dart';
import 'package:yessi_pau/Views/address.dart';
import 'package:yessi_pau/Views/login.dart';
import 'package:yessi_pau/widgets/appbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: pedidoCuenta(),
    );
  }
}

class pedidoCuenta extends StatefulWidget {
  @override
  _PedidoCuentaState createState() => _PedidoCuentaState();
}

class _PedidoCuentaState extends State<pedidoCuenta> {
  int _selectedIndex = 0;
  int cantidadProducto1 = 0;
  int cantidadProducto2 = 0;
  int cantidadProducto3 = 0;

  static List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    if (index == 0) {
      
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const address(),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => loginCustom(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Text(
            'Cuenta',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Table(
              border: TableBorder.all(
                  width: 7.0, color: Color.fromARGB(255, 255, 237, 253)),
              children: [
                TableRow(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 255, 0, 119)),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          'PRODUCTO',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          'MARCA Y CANTIDAD',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          'PRECIO UNITARIO',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          'TOTAL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                productoRow(
                  context,
                  'assets/base.jpg',
                  'Base',
                  'Matte',
                  1000.00,
                  '30/06/2024',
                  '05/07/2024',
                  cantidadProducto1,
                  (newVal) {
                    setState(() {
                      cantidadProducto1 = newVal;
                    });
                  },
                ),
                productoRow(
                  context,
                  'assets/barniz.jpeg',
                  'Barniz',
                  'Bissu',
                  258.00,
                  '28/06/2024',
                  '05/07/2024',
                  cantidadProducto2,
                  (newVal) {
                    setState(() {
                      cantidadProducto2 = newVal;
                    });
                  },
                ),
                productoRow(
                  context,
                  'assets/sombras.jpeg',
                  'Sombras Pastel',
                  'Matte',
                  258.00,
                  '29/06/2024',
                  '05/07/2024',
                  cantidadProducto3,
                  (newVal) {
                    setState(() {
                      cantidadProducto3 = newVal;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'PEDIDOS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'DIRECCIÓN',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'CIERRE DE SESION',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Color.fromARGB(255, 204, 68, 181),
        selectedItemColor: Color.fromARGB(255, 251, 255, 21),
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        onTap: _onItemTapped,
      ),
      backgroundColor: Color.fromARGB(245, 245, 245, 220),
    );
  }

  TableRow productoRow(
    BuildContext context,
    String imagePath,
    String productName,
    String brand,
    double price,
    String fechaCom,
    String fechaLlega,
    int quantity,
    Function(int) onQuantityChanged,
  ) {
    TextEditingController _controller =
        TextEditingController(text: '$quantity');

    void _updateQuantity(int newQuantity) {
      setState(() {
        onQuantityChanged(newQuantity);
      });
      _controller.text = '$newQuantity';
    }

    return TableRow(
      decoration: BoxDecoration(color: Colors.blue[100]),
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: 150,
                  height: 100,
                  alignment: Alignment.center,
                ),
                Text(productName, textAlign: TextAlign.center),
                Text('Fecha de compra: $fechaCom', textAlign: TextAlign.center),
                Text('Fecha de llegada: $fechaLlega',
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                Text(brand, textAlign: TextAlign.center),
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.remove, color: Colors.white),
                        onPressed: () {
                          int currentQuantity =
                              int.tryParse(_controller.text) ?? quantity;
                          if (currentQuantity > 0) {
                            _updateQuantity(currentQuantity - 1);
                          }
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 40,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        controller: _controller,
                        onChanged: (value) {
                          int newQuantity = int.tryParse(value) ?? 0;
                          _updateQuantity(newQuantity);
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          int currentQuantity =
                              int.tryParse(_controller.text) ?? quantity;
                          _updateQuantity(currentQuantity + 1);
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.clear, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _controller.clear(); // Limpiar el texto
                            onQuantityChanged(
                                0); // Actualizar la cantidad a cero
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('\$$price', textAlign: TextAlign.center),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('\$${(quantity * price).toStringAsFixed(2)}',
                textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}
