import 'package:flutter/material.dart';
import 'package:yessi_pau/Views/home.dart';
import 'package:yessi_pau/Views/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(245, 245, 245, 220),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Registro', style: TextStyle(fontSize: 40),),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 15.0, right: 15.0),
                  child: Column(
                    children: [
                      Text('CORREO'),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 229, 210, 232),
                          prefixIcon: Icon(Icons.email, color: Colors.blue),
                          border: OutlineInputBorder(),
                          labelText: 'Ingrese su correo',
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 15.0, right: 15.0),
                  child: const Column(
                    children: [
                      Text('CONTRASEÑA'),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 229, 210, 232),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Ingrese su contraseña',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: const SizedBox(
                        height: 60,
                        width: 250,
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Registrate',
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        ))),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      
                      children: [
                        const Text('¿Ya tienes una cuentas?'),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => loginCustom(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: const SizedBox(
                              height: 40,
                              width: 125,
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Inicia sesion',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ))),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
