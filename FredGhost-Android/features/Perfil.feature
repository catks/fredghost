# language: pt
@perfil @minha_conta
Funcionalidade: Validar Perfil

@entrar @reset @meus_dados @alterar @email @meus_enderecos @meus_pedidos @skip_feature_if_failed
Cenário: Entrar

Dado que estou na tela inicial
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
E devo me logar com email "prd-fred.automation@gmail.com" e com senha "123"
Quando clicar no menu lateral
Então devo ver que estou logado


@meus_dados
Cenário: Verificar Meus dados / Minha conta

Dado que estou na tela inicial
Quando clicar no menu lateral
E clico em "Minha conta"
E espero carregar
Então posso visualizar que meu nome é "Fred Testes Automation"
E que meu email é "prd-fred.automation@gmail.com"
E que meu RG é "123456789"
E que meu CPF é "86043838915"
E que minha Data de Nascimento é "17/12/1993"
E que meu Sexo é "Masculino"
E que meu Telefone é "(11) 5555-5551"
E que meu Telefone Celular é "(11) 99999-9991"

@alterar @dados
Cenário: Alterar Dados

Dado que estou na tela inicial
Quando clicar no menu lateral
E clico em "Minha conta"
E espero carregar
Então visualizo meus dados
Então clico no botão circular para editar
E edito o campo "Nome" com "Fred teste"
E edito o campo "Sobrenome" com "Testes Automation teste"
E edito o campo "R.G." com "12345678911"
E escolho a data do campo "Data de Nascimento" com o dia "28", mês "07" e ano "1992"
E edito o campo "Telefone" com "1155555552"
E edito o campo "Telefone Celular" com "11999999992"
E seleciono o campo "Sexo" como "Feminino"
E preencho o campo "Confirme sua senha" com "123"
Então aguardo "2" segundos
E clico em "Atualizar"
Então espero carregar
E clico em sair
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
E devo me logar com email "prd-fred.automation@gmail.com" e com senha "123"
Quando clicar no menu lateral
E clico em "Minha conta"
E espero carregar
E visualizo meus dados alterados
Então clico no botão circular para editar
E edito o campo "Nome" com "Fred"
E edito o campo "Sobrenome" com "Testes Automation"
E edito o campo "R.G." com "123456789"
E escolho a data do campo "Data de Nascimento" com o dia "17", mês "12" e ano "1993"
E edito o campo "Telefone" com "1155555551"
E edito o campo "Telefone Celular" com "11999999991"
E seleciono o campo "Sexo" como "Masculino"
E preencho o campo "Confirme sua senha" com "123"
Então aguardo "2" segundos
E clico em "Atualizar"
Então espero carregar
E visualizo meus dados alterados

@alterar @email
Cenário: Alterar E-mail

Dado que estou na tela inicial
Quando clicar no menu lateral
E clico em "Minha conta"
E espero carregar
E clico em "Alterar e-mail e/ou senha"
E preencho o campo "Novo e-mail" com "prd-fred2.automation@gmail.com"
Então coloco minha senha atual "123"
E clico em "OK"
Então espero carregar
E não devo ver uma mensagem de erro
E clico em sair
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
E devo me logar com email "prd-fred2.automation@gmail.com" e com senha "123"
Quando clicar no menu lateral
Então devo ver que estou logado
Então mudo o meu email para "prd-fred.automation@gmail.com"


@alterar @senha
Cenário: Alterar Senha

Dado que estou na tela inicial
Quando clicar no menu lateral
E clico em "Minha conta"
E espero carregar
E clico em "Alterar e-mail e/ou senha"
E preencho o campo "Nova senha" com "1234"
E preencho o campo "Repita a nova senha" com "1234"
Então coloco minha senha atual "123"
E clico em "OK"
Então espero carregar
E não devo ver uma mensagem de erro
E clico em sair
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
E devo me logar com email "prd-fred.automation@gmail.com" e com senha "1234"
Quando clicar no menu lateral
Então devo ver que estou logado
Então mudo a minha senha para "123" novamente


@meus_enderecos
Cenário: Verificar Meus Endereços

Dado que estou na tela inicial
Quando clicar no menu lateral
E clico em "Meus endereços"
E espero carregar
Então visualizo meus endereços



@meus_pedidos
#Então devo deslizar até a aba "Meus pedidos"
Cenário: Verificar Meus Pedidos
Dado que estou na tela inicial
Quando clicar no menu lateral
E clico em "Meus pedidos"
Então visualizo meus pedidos
