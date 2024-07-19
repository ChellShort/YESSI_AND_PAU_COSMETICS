import 'package:flutter/material.dart';
import 'package:yessi_pau/Views/details.dart';
import 'package:yessi_pau/database_helper.dart';

class SearchBarCustomInicio extends StatefulWidget {
  const SearchBarCustomInicio({super.key});

  @override
  State<SearchBarCustomInicio> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarCustomInicio> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _filteredProducts = [];

  void _searchProducts(String query) async {
    if (query.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'El campo de búsqueda está vacío. Por favor, introduce un término de búsqueda.'),
        ),
      );
      return;
    } else {
      List<Map<String, dynamic>> results =
          await dbHelper.searchProductsByName(query);
      if (results.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No se encontraron coincidencias'),
          ),
        );
        return;
      } else {
        setState(() {
          _filteredProducts = results;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Buscar',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                icon: GestureDetector(
                    onTap: () {
                      _searchProducts(_controller.text);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 135, 129, 189),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ),
        Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                final product = _filteredProducts[index];
                return GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => details_Custom(
                          image: product['imagen'],
                          nombreProducto: product['nombre'],
                          descripcionProducto:product['descripcion'],
                          precioProducto: product['precio']),
                    ))
                  },
                  child: ListTile(
                    leading: Image.network(product['imagen']),
                    title: Text( product['nombre']),
                    subtitle: Text(product['marca']),
                    trailing: Text('\$${product['precio']}'),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
