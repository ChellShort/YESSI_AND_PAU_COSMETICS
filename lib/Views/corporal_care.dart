import 'package:flutter/material.dart';
import 'package:yessi_pau/Views/details.dart';
import 'package:yessi_pau/widgets/dropdown_button.dart';
import 'package:yessi_pau/widgets/searchbar.dart';
import 'package:yessi_pau/views/home.dart';

class CorporalCare extends StatefulWidget {
  const CorporalCare({super.key});

  @override
  State<CorporalCare> createState() => _BrandsState();
}

class _BrandsState extends State<CorporalCare> {
  int currentelements = 0;
  RangeValues _currentRangeValues = const RangeValues(0.00, 4000.00);
  List<String> brandList = <String>[
    'SELECCIONA UNA OPCIÓN',
    'Mirabel',
    'Loreal',
    'Kumiko'
  ];
  List<String> productTypes = <String>[
    'SELECCIONA UNA OPCIÓN',
    'Maquillaje',
    'CorporalCare',
    'Cabello',
    'Cuidado corporal'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Cuidado Corporal',
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
                const SizedBox(width: 400, child: SearchBarCustom()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('MARCA:', style: TextStyle(color: Colors.white)),
                    SizedBox(
                        width: 300,
                        height: 50,
                        child: DropdownButtonExample(
                          list: brandList,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('TIPO DE PRODUCTO:',
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                        width: 220,
                        height: 50,
                        child: DropdownButtonExample(
                          list: productTypes,
                        )),
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
                          child: Text(
                              'De \$${_currentRangeValues.start.round()}.00',
                              style: const TextStyle(color: Colors.white)),
                        ),
                        SizedBox(
                            width: 200,
                            child: RangeSlider(
                                max: 4000.00,
                                min: 0.00,
                                values: _currentRangeValues,
                                onChanged: (RangeValues values) {
                                  setState(() {
                                    _currentRangeValues = values;
                                  });
                                })),
                        Text('A \$${_currentRangeValues.end.round()}.00',
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            currentelements = 6;
                          });
                        
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                      color: Colors.white,
                      child: Image.asset('assets/i$index.png')),
                  onTap: () {
                    index = index;
                    String image ='i${index.toString()}';
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => details_Custom(image: image),
                    ));
                  },
                );
              },
              itemCount: currentelements,
            ),
          ),
        ),
      ],
    );
  }
}
