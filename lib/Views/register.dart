import 'package:flutter/material.dart';
import 'package:yessi_pau/Views/home.dart';
import 'package:yessi_pau/Views/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
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
                  child: Text(
                    'Registro',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 15.0, right: 15.0),
                          child: Column(
                            children: [
                              const Text('CORREO'),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 229, 210, 232),
                                  prefixIcon:
                                      Icon(Icons.email, color: Colors.blue),
                                  border: OutlineInputBorder(),
                                  labelText: 'Ingrese su correo',
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      !value.contains('@')) {
                                    return 'Please enter an email';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 15.0, right: 15.0),
                          child: Column(
                            children: [
                              const Text('CONTRASEÑA'),
                              TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 229, 210, 232),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.blue,
                                  ),
                                  border: OutlineInputBorder(),
                                  labelText: 'Ingrese su contraseña',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 8) {
                                    return 'Password must be at least 8 characters long';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              }
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 23),
                                  ),
                                ))),
                          ),
                        ),
                      ],
                    )),
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
