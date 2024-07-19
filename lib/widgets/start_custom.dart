import 'package:flutter/material.dart';
import 'package:yessi_pau/widgets/carousel_publicity.dart';
import 'package:yessi_pau/widgets/searchbarStart.dart';
import 'package:yessi_pau/widgets/top_sales.dart';

class StartCustom extends StatefulWidget {
  const StartCustom({Key? key}) : super(key: key);

  @override
  _StartCustomState createState() => _StartCustomState();
}

class _StartCustomState extends State<StartCustom> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(width: 375, child: SearchBarCustomInicio()),
        CarouselPublicity(),
        TopProducts(),
      ],
    );
  }
}
