import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:ecommerce_app/models/my_product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 2, 40, 72),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelected = 0;
  String searchText = "";
  List<Product> productList = MyProducts.allProducts;

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = productList.where((product) {
      return product.description
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 300.0,
        backgroundColor: Colors.white,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/logo.jpg', // Caminho da imagem
              width: 90.0,
              height: 90.0,
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Olá usuário',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0), // Espaçamento entre os textos
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'O que está procurando hoje?',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(
                  255, 255, 255, 255), // Cor de fundo da barra
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            searchText = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Digite aqui para buscar',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0), // Espaço abaixo da barra de busca
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 2, 40, 72),
        child: Container(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.pink),
                onPressed: () {
                  // Lógica ao pressionar o ícone de home
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.pink),
                onPressed: () {
                  // Lógica ao pressionar o ícone de carrinho de compras
                },
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.pink),
                onPressed: () {
                  // Lógica ao pressionar o ícone de perfil
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
        child: Column(
          children: [
            _buildProductCategories(),
            Expanded(
              child: isSelected == 0
                  ? _buildFilteredProducts(filteredProducts)
                  : isSelected == 1
                      ? _buildFilteredProducts(MyProducts.gamerList)
                      : isSelected == 2
                          ? _buildFilteredProducts(MyProducts.networkList)
                          : _buildFilteredProducts(MyProducts.hardwareList),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCategories() {
    return Container(
      color: const Color.fromARGB(255, 118, 185, 239),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildProductCategory(index: 0, name: "All Products"),
          _buildProductCategory(index: 1, name: "Gamer"),
          _buildProductCategory(index: 2, name: "Network"),
          _buildProductCategory(index: 3, name: "Hardware"),
        ],
      ),
    );
  }

  Widget _buildProductCategory({required int index, required String name}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = index;
        });
      },
      child: Container(
        width: 100,
        height: 40,
        margin: const EdgeInsets.only(top: 10, left: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 118, 185, 239),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildFilteredProducts(List<Product> productList) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 3,
      ),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final product = productList[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              product.image,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10),
          Text(
            product.description,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            product.price,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
              color: Colors.black26,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.pink,
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text('Adicionar ao Carrinho'),
          ),
        ],
      ),
    );
  }
}
