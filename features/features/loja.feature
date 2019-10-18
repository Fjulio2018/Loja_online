  #language: pt
  #utf8
  #author: Francisco J M Nascimento
  Funcionalidade: Realizar a compra de um produto
  @compra
  Esquema do Cenario:  compra de produtos 
  Dado que acesse a loja virtual
  E escolha a aba T-shirts
  Quando escolher os produtos para o carrinho com sucesso
  E fizer login com as credenciais de acesso
    |email | <email> |
    |senha | <senha> |
  E realizo o aceite dos termos
  Entao realizo o checkout do produto

  Exemplos:
    | email                     | senha      |
    | Massarex@mailinator.com   | Senha@1234 |
  