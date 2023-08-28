class Produtos {
  final int id;
  final String nome;
  final String imagem;
  final String descricao;
  final String preco;
  int quantidade;

  Produtos(
      {required this.id,
      required this.nome,
      required this.preco,
      required this.descricao,
      required this.imagem,
      required this.quantidade});
}
