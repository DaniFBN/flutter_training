import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

class InitEndPage extends StatelessWidget {
  const InitEndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Quantifier Page',
      body: Column(
        children: const [
          Text('"^" - Indica que a String deve iniciar ali'),
          Text(r'"$" - Indica que a String deve terminar ali'),
        ],
      ),
    );
  }
}


^ - Inicio de texto
$ - Final de texto
* - 0.n
+ - 1.n
? - 0.1
{2} - Tamanho exato
{3,20} - Minimo 3 maximo 20
{3,} - Minimo 3 maximo N
[] - "Lista" de caracteres válidos
[^] - "Lista" de caracteres inválidos
() - Grupo, geralmente para tomada de decisão, ou juntar um padrão e tornar ele opcional por exemplo
| - Operador "OU"
Flag m - Torna a regex para multiline, ou seja, roda a regex para cada linha
  Torno o ^ e o $ por linha


^[A-Za-z]+,[a-z]+,[a-z._]+,([0-9]+|null),(?<Salary>[0-9]+\.[0-9]{1,2})(,\.br)*,\k'Salary'$

Whatever,asasas,addfs._gsfd,35345,90.12,90.12
Whatever,asasas,addfs._gsfd,null,90.12,.br,90.12
Whatever,asasas,addfs._gsfd,null,90.12,90.12
Whatever12,asasas,addfsgsfd,35345,90.12
Whatever,asaAsas,addfsgsfd,35345,90.12
Whatever,asasas,addfsg@sfd,35345,90.12
Whatever,asasas,addfsgsfd,35345.12,90.12
Whatever,asasas,addfsgsfd,35345,90.123
Whatever,asasas,addfs._gsfd,35345,90A12
