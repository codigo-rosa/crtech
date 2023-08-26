import 'package:ecommerce_app/models/my_product.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            "Our Products",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0, name: "Todos produtos"),
              _buildProductCategory(index: 1, name: "Gamer"),
              _buildProductCategory(index: 2, name: "Network"),
              _buildProductCategory(index: 3, name: "Harware"),
            ],
          ),
          const SizedBox(
              height: 80), // Espaçamento entre os botões e o conteúdo abaixo

          Expanded(
            child: isSelected == 0
                ? _buildAllProducts()
                : isSelected == 1
                    ? _buildGamer()
                    : isSelected == 2
                        ? _buildNetwork()
                        : _buildHardware(),
          ),
        ],
      ),
    );
  }

  _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected == index
                  ? Color.fromARGB(255, 19, 9, 75)
                  : Color.fromARGB(255, 26, 6, 62),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );

  _buildAllProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.allProducts.length,
        itemBuilder: (context, index) {
          final allProducts = MyProducts.allProducts[index];
          return ProductCard(product: allProducts);
        },
      );

  _buildGamer() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.gamerList.length,
        itemBuilder: (context, index) {
          final gamerList = MyProducts.gamerList[index];
          return ProductCard(product: gamerList);
        },
      );

  _buildHardware() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: (50 / 70),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.hardwareList.length,
        itemBuilder: (context, index) {
          final hardwareList = MyProducts.hardwareList[index];
          return ProductCard(product: hardwareList);
        },
      );

  _buildNetwork() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: (30 / 30),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.networkList.length,
        itemBuilder: (context, index) {
          final networkList = MyProducts.networkList[index];
          return ProductCard(product: networkList);
        },
      );
}
