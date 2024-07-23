import 'package:flutter/material.dart';
import 'package:yessi_pau/widgets/brands.dart';
import 'package:yessi_pau/widgets/corporal_care.dart';
import 'package:yessi_pau/widgets/hair.dart';
import 'package:yessi_pau/widgets/makeup.dart';
import 'package:yessi_pau/widgets/skincare.dart';
import 'package:yessi_pau/widgets/cart.dart';
import 'package:yessi_pau/widgets/drawer.dart';
import 'package:yessi_pau/widgets/start_custom.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    List<Widget> myBody = [
      const StartCustom(),
      const Brands(),
      const Makeup(),
      const Skincare(),
      const Hair(),
      const CorporalCare(),
      cartScreen()
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
      }, username: widget.username ?? 'username',
      ),
      body: ListView(
        children: <Widget>[
          myBody[index],
        ],
      ),
    );
  }
}
