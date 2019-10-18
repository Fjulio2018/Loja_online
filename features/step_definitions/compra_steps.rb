# frozen_string_literal: true

Dado("que acesse a loja virtual") do
  Acesso.new.load
  valida_abertura_pagina("http://automationpractice.com/index.php?", 3)
end
Dado("escolha a aba T-shirts") do
  Acesso.new.pagina_camiseta
  aguardar(3)
  expect(page).to have_content("T-shirts")
  expect(page).to have_content("The must have of your wardrobe, take a look at our different colors,")
end
Quando("escolher os produtos para o carrinho com sucesso") do
  Tshirts.new.clic_foto_menina
  last = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(last)
  Tshirts.new.tamanho_m
  Tshirts.new.cor_az
  aguardar(5)
  Tshirts.new.add_car
  Tshirts.new.chkout
  aguardar(2)
  expect(page).to have_content("Faded Short Sleeve T-shirts")
  expect(page).to have_content("Color : Blue")
  expect(page).to have_content("Size : M")
  expect(page).to have_content("SKU : demo_1")
  ControleOrderPage.new.prosschkt_controle
end
E("fizer login com as credenciais de acesso") do |table|
  usuario = table.rows_hash
  @user = usuario[:email]
  @password = usuario[:senha]
  puts "Este é o usuário:#{@user}"
  puts "Esta é a senha: #{@password}"
  AuthenticPage.new.preenche(usuario[:email], usuario[:senha])
  take_screenshot($scenario_name.downcase!, "login")
  AuthenticPage.new.login
  expect(page).to have_content("ADDRESSES")
  expect(page).to have_content("Rua xpto, 23, geoar Rua xpto 22")
  expect(page).to have_content("Xpeto, Kansas 32509")
  expect(page).to have_content("1132334455")
  expect(page).to have_content("199934456")
  ControleEnderecoPage.new.prossship
end

E ("realizo o aceite dos termos") do
  expect(page).to have_content("Shipping")
  ControleShipPage.new.concordo
  ControleShipPage.new.ir_pagto
end

Então("realizo o checkout do produto") do
  aguardar(3)
  expect(page).to have_content("PLEASE CHOOSE YOUR PAYMENT METHOD")
  expect(page).to have_content("$18.51")
  ControlePayPage.new.pagto_check
  aguardar(2)
  expect(page).to have_content("CHECK PAYMENT")
  expect(page).to have_content("$18.51")
  ControlePayPage.new.confirma
  expect(page).to have_content("YOUR CHECK MUST INCLUDE:")
  expect(page).to have_content("Your order on My Store is complete.")
  expect(page).to have_content("$18.51")
end
