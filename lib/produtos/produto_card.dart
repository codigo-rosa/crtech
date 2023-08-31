import 'produtos.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importando o pacote intl para formatação de números como moeda

class ProdutoCard extends StatefulWidget {
  final Produtos produtos;

  const ProdutoCard({Key? key, required this.produtos}) : super(key: key);

  @override
  State<ProdutoCard> createState() => EstadoDoProdutoCard();
}

class EstadoDoProdutoCard extends State<ProdutoCard> {
  final NumberFormat priceFormatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$'); // Criando um formato de número para formatação da moeda

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              widget.produtos.imagem, // Exibindo a imagem do produto
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.produtos.nome,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            priceFormatter.format(widget.produtos
                .preco), // Exibindo o preço do produto formatado como moeda
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
