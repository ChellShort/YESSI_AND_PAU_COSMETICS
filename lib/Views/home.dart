import 'package:flutter/material.dart';
import 'package:yessi_pau/Views/brands.dart';
import 'package:yessi_pau/Views/corporal_care.dart';
import 'package:yessi_pau/Views/hair.dart';
import 'package:yessi_pau/Views/makeup.dart';
import 'package:yessi_pau/Views/skincare.dart';
import 'package:yessi_pau/Views/start_custom.dart';
import 'package:yessi_pau/widgets/drawer.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    List<Widget> myBody = const [
      StartCustom(),
      Brands(),
      Makeup(),
      Skincare(),
      Hair(),
      CorporalCare()
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'YESSI & PAU',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(255, 244, 152, 157),
      ),
      drawer: DrawerCustom(cIndex: (i) {
        setState(() {
          index = i; // Se asigna el valor del elemento del drawer para redibujar el body
        });
      }),
      body: ListView(
        children: <Widget>[
          myBody[index],
        ],
      ),
    );
  }
}
