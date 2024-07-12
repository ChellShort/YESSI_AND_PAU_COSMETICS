import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:yessi_pau/utils/carousel_items.dart';

class CarouselPublicity extends StatefulWidget {
  const CarouselPublicity({super.key});

  @override
  State<CarouselPublicity> createState() => _CarouselPublicityState();
}

class _CarouselPublicityState extends State<CarouselPublicity> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
        );
  }
}