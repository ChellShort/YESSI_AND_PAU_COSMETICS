import 'package:flutter/material.dart';
class ProductCounter extends StatefulWidget {
  final int inventory;

  ProductCounter({required this.inventory});

  @override
  _ProductCounterState createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int _counter = 1;

  void _incrementCounter() {
    if (_counter < widget.inventory) {
      setState(() {
        _counter++;
      });
    }
  }

  void _decrementCounter() {
    if (_counter > 1) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: _decrementCounter,
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 20.0),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _incrementCounter,
            ),
          ],
        ),
      ],
    );
  }
}
