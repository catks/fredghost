# language: pt
@login @timeout
Funcionalidade: Login

@reset
Cenário: Entrar com usuário não Cadastro

Dado que estou na tela inicial
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
E devo me logar com email "naoexiste@email.com" e com senha "123"
Então devo ver uma mensagem de erro
E aguardo "10" segundos

@reset
Cenário: Entrar com email incorreto

Dado que estou na tela inicial
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
E devo me logar com email "prd-fred.automationgmail.com" e com senha "123"
Então devo ver uma mensagem de erro

@reset
Cenário: Entrar com senha incorreta

Dado que estou na tela inicial
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
E devo me logar com email "prd-fred.automation@gmail.com" e com senha "987"
Então devo ver uma mensagem de erro

@reset
Cenário: Entrar com usuário cadastrado
Dado que estou na tela inicial
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
E devo me logar com email "prd-fred.automation@gmail.com" e com senha "123"
Então não devo ver uma mensagem de erro
