import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:yessi_pau/utils/carousel_items.dart';

class StartCustom extends StatelessWidget {
  const StartCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBar(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 400,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 135, 129, 189)),
            child: CarouselSlider(
              options: CarouselOptions(
                  height: 300.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn),
              items: imagenes.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: Image.asset(
                        item,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
          child: Container(
            height: 900,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 125, 167, 217)),
            child: Builder(builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Image.asset('assets/logo.png'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Nombre'),
                              Text('{Numero de estrellas}'),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
