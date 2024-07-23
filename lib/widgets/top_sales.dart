import 'package:flutter/material.dart';
import 'package:yessi_pau/Views/details.dart';
import 'package:yessi_pau/database_helper.dart';

class TopProducts extends StatefulWidget {
  const TopProducts({super.key});

  @override
  State<TopProducts> createState() => _topProductsState();
}

class _topProductsState extends State<TopProducts> {

  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
      child: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 125, 167, 217)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                'TOP 5 EN VENTAS',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: dbHelper.getTopProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text('Error al cargar los productos');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No hay productos disponibles');
                  } else {
                    final topProducts = snapshot.data!;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final product = topProducts[index];
                        return GestureDetector(
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => details_Custom(
                                  idProducto: product['id_producto'],
                                  image: product['imagen'],
                                  nombreProducto: product['nombre'],
                                  nombreMarca: product['marca'],
                                  descripcionProducto: product['descripcion'],
                                  precioProducto: product['precio']),
                            ))
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Image.network(product['imagen']) 
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 180,
                                      child: Text(
                                        product['nombre'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(product['marca']),
                                    Text(
                                      '⭐ ${product['estrellas']}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                    
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
