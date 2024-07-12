import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBarCustom extends StatefulWidget {
  const SearchBarCustom({super.key});

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
          child: SearchBar(
            hintText: 'Buscar',
            shape:  WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )
          )
        ),
      ),
    ));
  }
}