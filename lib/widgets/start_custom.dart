import 'package:flutter/material.dart';
import 'package:yessi_pau/widgets/carousel_publicity.dart';
import 'package:yessi_pau/widgets/searchbar.dart';
import 'package:yessi_pau/widgets/searchbarStart.dart';
import 'package:yessi_pau/utils/producto_model.dart';
import 'package:yessi_pau/widgets/top_sales.dart';

class StartCustom extends StatefulWidget {
  const StartCustom({Key? key}) : super(key: key);

  @override
  _StartCustomState createState() => _StartCustomState();
}

class _StartCustomState extends State<StartCustom> {
  late Future<List<Product>> futureTop5Products;

  @override
  void initState() {
    super.initState();
    futureTop5Products = fetchTop5Products();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(width: 375, child: SearchBarCustomInicio()),
        const CarouselPublicity(),
        TopProducts(topProduct: futureTop5Products,),
      ],
    );
  }
}
