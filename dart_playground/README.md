# Exercícios

## Média
Faça um programa que calcule a média do aluno

* O usuário deve inserir 2 notas, de 0 a 10.
* Cada nota deve ter um peso, podendo ser escolhido entre 1 a 3.
* Com base nos valores recebidos, calcule a média.

### Requisitos técnicos
* Deve ser feito com `if` e `switch`.

## Banco
Crie uma aplicação simples de banco.

* O usuário deve inserir um nome e uma senha de 8 dígitos.
* O usuário deve escolher entre conta poupança ou corrente.
* A conta deve ser criada automaticamente e os dados devem ser exibidos.
* Faça um menu interativo onde:
  * Ao digitar 1, o usuário possa depositar um valor.
  * Ao digitar 2, o usuário pode sacar um valor.
  * Ao digitar 3, o usuário pode exibir o saldo e os dados da sua conta.
  * Ao digitar 4, o usuário pode ver o extrato, contendo o histórico de transações.
  * Ao digitar 5:
    * Se a conta for poupança, deve ser exibido uma prévia de rendimento.   
      * O dinheiro na conta deve render 2% ao mês.  
      * O usuário deve enviar quantos meses ele deseja consultar, não podendo exceder 24 meses.
    * Se a conta for corrente, deve ser possível fazer uma transferência.
      * O usuário deve inserir um nome(Fictício, como se fosse um pix por Nome).
      * O usuário deve inserir o valor a ser transferido.
  * Ao digitar 0, o aplicativo é fechado, deve ser confirmado antes de fechar.
* Antes de concluir cada operação, a senha deve ser confirmada.

### Requisitos técnicos
* Estruture seus `Models` aproveitando os pilares de POO.

## Buscador de CEP

Faça um buscador de CEP usando a API do [ViaCep](https://viacep.com.br).

* O usuário deve enviar um cep, podendo ter a mascara(#####-###) ou não.
* Os dados devem ser convertidos em um Model.
* Ao buscar, deve ser mostrado no terminal os dados.
* Enquanto o usuário não digitar(input) 0, deve se repetir.
