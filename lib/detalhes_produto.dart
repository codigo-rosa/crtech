// import 'package:flutter/material.dart';
// import 'package:crtech/produtos/produtos.dart';

// class CategoriaProdutosScreen extends StatelessWidget {
//   final String categoria;
//   final List<Produtos> todosProdutos;

//   CategoriaProdutosScreen({required this.categoria, required this.todosProdutos});

//   List<Produtos> getProdutosPorCategoria() {
//     // Filtrar os produtos com base na categoria desejada
//     return todosProdutos.where((produto) => produto.categoria == categoria).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final produtosDaCategoria = getProdutosPorCategoria();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Produtos da Categoria: $categoria'),
//       ),
//       body: ListView.builder(
//         itemCount: produtosDaCategoria.length,
//         itemBuilder: (context, index) {
//           final produto = produtosDaCategoria[index];
//           return ListTile(
//             leading: Image.asset(produto.imagem),
//             title: Text(produto.nome),
//             subtitle: Text('Preço: R\$ ${produto.preco.toStringAsFixed(2)}'),
//             onTap: () {
//               // Ao tocar em um produto, você pode navegar para a página de detalhes ou fazer o que desejar.
//               // Por exemplo, você pode usar Navigator para navegar para a página de detalhes do produto.
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetalhesProduto(produto: produto),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class DetalhesProduto extends StatelessWidget {
//   final Produtos produto;

//   DetalhesProduto({required this.produto});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(produto.nome),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(produto.imagem),
//             Text('Nome: ${produto.nome}'),
//             Text('Preço: R\$ ${produto.preco.toStringAsFixed(2)}'),
//             Text('Descrição: ${produto.descricao}'),
//             // Adicione outras informações do produto aqui
//           ],
//         ),
//       ),
//     );
//   }
// }