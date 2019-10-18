# frozen_string_literal: true

class AuthenticPage < SitePrism::Page
  element :username, :xpath, "//*[@id='email']"
  element :password, :xpath, "//*[@id='passwd']"
  element :loga, :xpath, "//*[@id='SubmitLogin']"
  element :email_creden, :xpath, "//input[@id='email_create']"
  element :creden_novo, 'input[name="SubmitCreate"]'

  def preenche(email, senha)
    username.set(email)
    password.set(senha)
  end
  def login
    loga.click
  end

  def ir_creden
    email_creden.set(novo_email)
    creden_novo.click  
  end
end
