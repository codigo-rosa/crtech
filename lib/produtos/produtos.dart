class Produtos {
  final int id;
  final String nome;
  final String imagem;
  final String descricao;
  final double preco;
  final double quantidade;

  Produtos({
    required this.id,
    required this.nome,
    required this.preco,
    required this.descricao,
    required this.imagem,
    required this.quantidade,
  });
}
