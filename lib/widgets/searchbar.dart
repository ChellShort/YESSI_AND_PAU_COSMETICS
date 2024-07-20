// searchbar.dart
import 'package:flutter/material.dart';

class SearchBarCustom extends StatefulWidget {
  final TextEditingController controller; // Agrega el controlador

  const SearchBarCustom({super.key, required this.controller});

  @override
  State<SearchBarCustom> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            controller: widget.controller, // Usa el controlador
            decoration: InputDecoration(
              hintText: 'Buscar',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
