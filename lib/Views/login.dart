import 'package:flutter/material.dart';
import 'package:yessi_pau/Views/home.dart';
import 'package:yessi_pau/Views/register.dart';
import 'package:yessi_pau/database_helper.dart';

class loginCustom extends StatefulWidget {
  loginCustom({super.key});

  @override
  State<loginCustom> createState() => _loginCustomState();
}

class _loginCustomState extends State<loginCustom> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final dbHelper = DatabaseHelper();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      String correo = _emailController.text;
      String contrasena = _passwordController.text;

      final cuenta = await dbHelper.getCuentaByEmailAndPassword(correo, contrasena);

      if (cuenta != null) {
        String username = cuenta['username'] ?? 'Usuario'; // Manejo de null
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(username: username),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Correo o contraseña incorrectos'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(245, 245, 245, 220),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/texto.png',
                  width: 150,
                ),
                Image.asset(
                  'assets/logo.png',
                  width: 300,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Text('CORREO'),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 229, 210, 232),
                                prefixIcon: Icon(Icons.email, color: Colors.blue),
                                border: OutlineInputBorder(),
                                labelText: 'Ingrese su correo',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty || !value.contains('@')) {
                                  return 'Por favor, ingrese un correo válido';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Text('CONTRASEÑA'),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 229, 210, 232),
                                prefixIcon: Icon(Icons.lock, color: Colors.blue),
                                border: OutlineInputBorder(),
                                labelText: 'Ingrese su contraseña',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, ingrese su contraseña';
                                } else if (value.length < 8) {
                                  return 'La contraseña debe tener al menos 8 caracteres';
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
                          onPressed: _login,
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
                                  'Login',
                                  style: TextStyle(color: Colors.white, fontSize: 23),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      const Text(
                        '¿No tienes cuenta? Regístrate aquí',
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Register(),
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
                                'Register',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
