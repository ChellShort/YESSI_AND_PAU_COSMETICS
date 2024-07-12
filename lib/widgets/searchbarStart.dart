import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:yessi_pau/Views/details.dart';
import 'package:yessi_pau/utils/producto_model.dart';

class SearchBarCustomInicio extends StatefulWidget {
  const SearchBarCustomInicio({super.key});

  @override
  State<SearchBarCustomInicio> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarCustomInicio> {
  final TextEditingController _controller = TextEditingController();
  List<Product> _filteredProducts = [];

  void _searchProducts(String query) async {
    final results = await fetchProductsByName(query);
    setState(() {
      _filteredProducts = results;
    });
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
              ),
              onChanged: (value) {
                _searchProducts(value);
              },
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
                          image: product.imageUrl,
                          nombreProducto: product.name,
                          descripcionProducto: product.description,
                          precioProducto: product.price),
                    ))
                  },
                  child: ListTile(
                    leading: Image.network(product.imageUrl),
                    title: Text(product.name),
                    subtitle: Text(product.brand),
                    trailing: Text('\$${product.price}'),
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
