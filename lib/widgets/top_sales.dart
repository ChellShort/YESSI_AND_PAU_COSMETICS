import 'package:flutter/material.dart';
import 'package:yessi_pau/Views/details.dart';
import 'package:yessi_pau/utils/producto_model.dart';

class TopProducts extends StatefulWidget {
  final Future<List<Product>> topProduct;
  const TopProducts({super.key , required this.topProduct});

  @override
  State<TopProducts> createState() => _topProductsState();
}

class _topProductsState extends State<TopProducts> {
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
                    'TOP 5 VENTAS',
                    style: TextStyle(fontSize: 25),
                  ),
                  FutureBuilder<List<Product>>(
                    future: widget.topProduct,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const Text('Error al cargar los productos');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text('No hay productos disponibles');
                      } else {
                        final products = snapshot.data!;
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => details_Custom(
                                      image: product.imageUrl,
                                      nombreProducto: product.name,
                                      descripcionProducto: product.description,
                                      precioProducto: product.price),
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
                                      decoration: const BoxDecoration(
                                          color: Colors.white),
                                      child: Image.network(product.imageUrl),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          product.name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        Text('${product.rating} estrellas'),
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