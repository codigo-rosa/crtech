import 'package:flutter/material.dart';
import '../models/produtos.dart';

class ProdutoCard extends StatefulWidget {
  final Produtos produtos;

  const ProdutoCard({super.key, required this.produtos});

  @override
  State<ProdutoCard> createState() => EstadoDoProdutoCard();
}

class EstadoDoProdutoCard extends State<ProdutoCard> {
  @override
  Widget build(BuildContext contex) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.favorite_border_outlined,
                color: Colors.pink,
              )
            ],
          ),
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              widget.produtos.imagem,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.produtos.nome,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.produtos.nome,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.pink,
            ),
          ),
          Text(
            '\$' '${widget.produtos.preco}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
