import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AccountPage(),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YESSI & PAU',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFF4A4B5),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Text(
                'Cuenta',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFF94BDF2),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text('Dirección',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black))),
                      Expanded(
                          child: Text('Código Postal',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black))),
                      Expanded(
                          child: Text('País',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black))),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                          child: Text('742 de Evergreen Terrace',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black))),
                      Expanded(
                          child: Text('42820',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black))),
                      Expanded(
                          child: Text('USA',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFD1B2E0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('PEDIDOS', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {},
              child: Text('DIRECCION', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {},
              child:
                  Text('CIERRE DE SESIÓN', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
