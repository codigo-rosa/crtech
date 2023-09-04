import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carrossel extends StatelessWidget {
  final List<String> imageList = [
    "assets/banner.png",
    //"assets/banner.png",
  ];

  Carrossel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 60, // Defina a altura desejada para suas imagens
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
              child: Image.network(
                image,
                width: double.infinity, // Largura da imagem
                fit: BoxFit
                    .cover, // Mantém a proporção da imagem e preenche o espaço
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
