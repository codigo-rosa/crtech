import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carrossel extends StatelessWidget {
  final List<String> imageList = [
    "assets/cr.jpg",
  ];

  Carrossel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height:
            50, // Ajuste a altura de acordo com a dimensão original da imagem
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        enlargeCenterPage: false,
      ),
      items: imageList.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              child: Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit
                    .contain, // Use BoxFit.contain para manter a qualidade
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
