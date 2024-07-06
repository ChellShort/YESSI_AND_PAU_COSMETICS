import 'package:flutter/material.dart';

class AppbarCustom extends StatefulWidget {
  const AppbarCustom({super.key});

  @override
  State<AppbarCustom> createState() => _AppbarCustomState();
}

class _AppbarCustomState extends State<AppbarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: const Text(
          'YESSI & PAU',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(255, 244, 152, 157),
      );
  }
}