import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carrossel extends StatelessWidget {
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2018/09/17/14/27/headphones-3683983_1280.jpg",
    "https://cdn.pixabay.com/photo/2012/03/01/01/00/blue-19898_1280.jpg",
    "https://cdn.pixabay.com/photo/2014/08/04/09/21/board-409582_1280.jpg",
    "https://media.istockphoto.com/id/1270583054/pt/foto/selective-focus-at-router-internet-router-on-working-table-with-blurred-man-connect-the-cable.webp?b=1&s=612x612&w=0&k=20&c=ywjQBuqPn2p6m7-F4qbcpS4qquRWej-fJ_ywo8UR_SM=",
    "https://cdn.pixabay.com/photo/2016/06/01/19/56/board-1429589_1280.jpg",
    "https://cdn.pixabay.com/photo/2019/06/11/16/06/background-white-4267347_1280.jpg",
    "https://media.istockphoto.com/id/1314343964/photo/top-end-system-unit-for-gaming-computer-close-up.webp?b=1&s=612x612&w=0&k=20&c=QjCT6KLtoMluGde2YuD2ZPdbnCopnPElbOI_LYcge_Q="
  ];

  Carrossel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 100, // Defina a altura desejada para suas imagens
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
