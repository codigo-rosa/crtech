import 'package:ecommerce_app/models/produtos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../widgets/Header.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      body: CartElements(),
      backgroundColor: Colors.white,
    );
  }
}

class CartElements extends StatelessWidget {
  const CartElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(children: <Widget>[CartTitle(), CartItems()]);
  }
}

class CartTitle extends StatelessWidget {
  const CartTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: Text('Carrinho',
            style: GoogleFonts.inter(
                fontStyle: FontStyle.normal,
                textStyle: Theme.of(context).textTheme.titleLarge)));
  }
}

class CartItems extends StatelessWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16)),
            color: Color.fromRGBO(217, 217, 217, 1)),
        constraints: BoxConstraints(maxHeight: screenHeight - 136),
        child:
            Column(children: <Widget>[CartHeader(), const CartProductsList()]),
      ),
    ));
  }
}

// ignore: must_be_immutable
class CartHeader extends StatelessWidget {
  CartHeader({Key? key}) : super(key: key);

  double orderTotal = CartProductsPrice.price;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            Text('Total: ',
                style: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal))),
            Text(
                '${NumberFormat.compactSimpleCurrency(locale: 'pt-BR', decimalDigits: 2).format(orderTotal)}',
                style: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)))
          ]),
        ),
        const Spacer(),
        Padding(
            padding: const EdgeInsets.all(16),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal)),
                backgroundColor: const Color.fromRGBO(236, 33, 99, 1),
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Text('Finalizar Compra'),
            )),
      ],
    ));
  }
}

class CartProductsList extends StatefulWidget {
  const CartProductsList({super.key});

  @override
  State<StatefulWidget> createState() => _CartProductListState();
}

class CartProductsPrice {
  static double price = _CartProductListState()._products.fold<double>(
      0, (sum, item) => sum + double.parse(item.preco).toDouble());
}

class _CartProductListState extends State<CartProductsList> {
  List<Produtos> _products = [];

  void _addProduct(produto) {
    setState(() {
      _products.add(produto);
    });
  }

  void _removeProduct(produto) {
    setState(() {
      _products.remove(produto);
    });
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            itemCount: _products.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Wrap(
                      children: [
                        Row(
                          children: [
                            Image.network(
                              _products[index].imagem.toString(),
                              width: 100,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                            _products[index].nome.toString(),
                                            style: const TextStyle(
                                              overflow: TextOverflow.clip,
                                            ),
                                            textAlign: TextAlign.right,
                                            softWrap: true))),
                                Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        Text(
                                          NumberFormat.compactSimpleCurrency(
                                                  locale: 'pt-BR',
                                                  decimalDigits: 2)
                                              .format(_products[index].preco),
                                          textAlign: TextAlign.right,
                                        )
                                      ],
                                    ))
                              ],
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));
            }),
      ],
    );
  }
}
