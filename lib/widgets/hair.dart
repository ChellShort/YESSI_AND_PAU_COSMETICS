import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yessi_pau/Views/details.dart';
import 'package:yessi_pau/database_helper.dart';
import 'package:yessi_pau/widgets/searchbar.dart';

class Hair extends StatefulWidget {
  const Hair({super.key});

  @override
  State<Hair> createState() => _BrandsState();
}

class _BrandsState extends State<Hair> {
  int currentelements = 0;
  RangeValues _currentRangeValues = const RangeValues(0.00, 4000.00);
  List<String> brandList = <String>[];
  List<String> productTypes = <String>[];
  double RangeSliderMax = 4000.00;
  String? _selectedBrand;
  String? _selectedCategory;
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> searchResults = [];

  @override

  void initState() {
    super.initState();
    _loadBrands();
    _loadProducts();
    _loadHighestPrice();
  }

  Future<void> _loadBrands() async {
    List<String> brands = await DatabaseHelper().getMarcas();
    setState(() {
      brandList = brands;
    });
  }

  Future<void> _loadProducts() async {
    List<String> products = await DatabaseHelper().getSubCategorias('cabello');
    setState(() {
      productTypes = products;
    });
  }

  Future<void> _loadHighestPrice() async {
    double highestPrice = await DatabaseHelper().getHighestPrice();
    setState(() {
      _currentRangeValues = RangeValues(0.00, highestPrice);
      RangeSliderMax = highestPrice;
    });
  }

  Future<void> _searchProducts() async {
    String _selectedName = _searchController.text; // Obtén el texto del controlador
    //print('Buscando productos $_selectedName $_selectedBrand $_selectedCategory $_currentRangeValues $_selectedName');
    List<Map<String, dynamic>> results = await DatabaseHelper().searchProducts(
      brand: _selectedBrand,
      category: 'Cabello',
      subcategory: _selectedCategory,
      priceRange: _currentRangeValues,
      name: _selectedName, // Pasa el texto a la consulta
    );
    //print(results);
    setState(() {
      searchResults = results;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Cabello',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: const Color(0xFF8771BD),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(width: 400, child: SearchBarCustom(controller: _searchController)), // Usa el controlador
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('MARCA:', style: TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: DropdownButton<String>(
                        icon: const SizedBox.shrink(),
                        padding: const EdgeInsets.only(left: 10.0),
                        value: _selectedBrand,
                        hint: const Text('Selecciona una opción'),
                        items: brandList.map((brand) {
                          return DropdownMenuItem(
                            value: brand,
                            child: Text(brand),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedBrand = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('TIPO DE PRODUCTO:', style: TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 220,
                      height: 50,
                      child: DropdownButton<String>(
                        icon: const SizedBox.shrink(),
                        padding: const EdgeInsets.only(left: 10.0),
                        value: _selectedCategory,
                        hint: const Text('Selecciona una opción'),
                        items: productTypes.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text('PRECIO:', style: TextStyle(color: Colors.white)),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 85,
                          child: Text('De \$${_currentRangeValues.start.round()}.00', style: const TextStyle(color: Colors.white)),
                        ),
                        SizedBox(
                          width: 200,
                          child: RangeSlider(
                            max: RangeSliderMax,
                            min: 0.00,
                            values: _currentRangeValues,
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues = values;
                              });
                            },
                          ),
                        ),
                        Text('A \$${_currentRangeValues.end.round()}.00', style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: _searchProducts,
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final product = searchResults[index];
                return GestureDetector(
                  child: Container(
                    color: Colors.white,
                    child: Image.network(product['imagen']),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => details_Custom(
                        idProducto: product['id_producto'],
                        image: product['imagen'],
                        nombreProducto: product['nombre'],
                        nombreMarca: product['marca'],
                        descripcionProducto: product['descripcion'],
                        precioProducto: product['precio'],
                      ),
                    ));
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
