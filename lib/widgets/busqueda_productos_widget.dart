import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:yessi_pau/widgets/searchbar.dart';
import 'package:yessi_pau/widgets/skincare.dart';
import 'package:yessi_pau/widgets/dropdown_button.dart';
import 'package:yessi_pau/widgets/searchbarStart.dart';

class BusquedaProductos extends StatefulWidget {
  final List<String> brandList;
  final List<String> productTypes;
  final RangeValues currentRangeValues;
  final int currentelements;
  const BusquedaProductos(
      {super.key,
      required this.brandList,
      required this.productTypes,
      required this.currentRangeValues,
      required this.currentelements});

  @override
  State<BusquedaProductos> createState() => _BusquedaProductosState();
}

class _BusquedaProductosState extends State<BusquedaProductos> {
  @override
  Widget build(BuildContext context) {
    RangeValues currentRangeValues = widget.currentRangeValues;
    int currentelements = widget.currentelements;
    return Padding(
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
                      list: widget.brandList,
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
                      list: widget.productTypes,
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
                          'De \$${widget.currentRangeValues.start.round()}.00',
                          style: const TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                        width: 200,
                        child: RangeSlider(
                            max: 4000.00,
                            min: 0.00,
                            values: widget.currentRangeValues,
                            onChanged: (RangeValues values) {
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const Skincare(),
                                ));
                              });
                            })),
                    Text('A \$${widget.currentRangeValues.end.round()}.00',
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
    );
  }
}
