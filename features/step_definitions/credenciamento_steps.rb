Dado("que estou na tela de login com os dados de cadastro") do
#  step "que acesse a loja virtual" 
#  step "escolha a aba T-shirts"
#  step "escolher os produtos para o carrinho com sucesso" 
 puts @Fname = "#{Faker::Name.first_name}"
 puts @Lname = "#{Faker::Name.last_name}"
 puts @documento = "#{Faker::CPF.numeric}"
 puts @novo_email = @Lname + @Fname + @documento + "@mailinator.com"
 puts @senha = "@" + @Fname + @documento
 puts @data_nascimento = "#{Faker::Date.birthday(min_age: 18, max_age: 65)}"
 puts @endereco = "#{Faker::Address.full_address}"
 puts @endereco2 = "#{Faker::Address.full_address}"
 puts @endereco3 = "#{Faker::Address.street_suffix}"
 
end

Quando("realizar o credenciamento com os dados") do
  
end

Entao("o cadastro será feito com sucesso") do
  
end
