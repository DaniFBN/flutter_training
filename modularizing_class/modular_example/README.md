# Modular

## Module

### Module

Esse é o módulo padrão e o mais recomendado em 99% das situações.  
É como nós usamos, com os `imports`, `routes` e `binds`.
Ele funciona com 1 pra N. 1 Module para N rotas

### Widget Module

O módulo é especificamente um Widget, a estrutura dele é diferente, não existem rotas, apenas qual a página.
Ele funciona com 1 pra 1. 1 WidgetModule para 1 rota.

---

## Injeção

### Factory

Sempre que for chamada(.get/context.read), retornará uma nova instância.

### Instance

Sempre que for chamada, retornará a mesma instância, porém na hora da injeção, você envia uma instância, diferentemente das outras que recebem uma função anônima para criar

### Singleton

Sempre que for chamado, retornará a mesma instância, independente de onde e quantas vezes, será a mesma instância.  
Será criada no momento em que o app é iniciado.

### LazySingleton

Sempre que for chamado, retornará a mesma instância, independente de onde e quantas vezes, será a mesma instância.  
Será criado no momento em que é chamado.

### AsyncBind

É uma injeção assíncrona e singleton.

---

## Import e export

Quando você importa um módulo, será importado apenas o que foi exportado.  
É recomendado que todos os exports estejam em módulo `core`, para facilitar a manutenção e o entendimento do software.  
O import não importará as rotas, somente os `binds` e `imports` que foram previamente exportados.

---

## Routes

### ChildRoute

Uma rota que o child deve ser especificamente um `Widget`

### ModuleRoute

Uma rota que o child deve ser especificamente um `Module`

### WildcardRoute

Uma rota para quando não for encontrado nenhuma outra rota.  
Basicamente é uma rota de `Not found`.

### Params

A passagem de parâmetros pode ser feita pela rota mesmo, por exemplo `product/1` onde o `1` é o parâmetro

### Transition

As transições das páginas podem ser colocadas nos `Modules`, podem ser `ChildRoute` ou `ModuleRoute`.  
Existem alguns tipos de transições pré-feitas e também é possível fazer uma transição personalizada.

---

## Guards

Os guards são proteções as rotas, são mais efetivas na Web, porque o usuário pode "forçar" uma rota pela url.  
No Mobile, o usuário acessar uma rota que não deveria, é algo estranho, na teoria você pode proteger isso por alguma lógica, sem necessitar do guard, tendo em vista que é o `dev` que controla a exibição/navegação do app.  
Pode ser muito útil o uso de guard em notificações, devido ela vir de fora e apresentar alguma rota específica, mas que o usuário pode não ter acesso.

---

## Evite usar

### Modular.get

Ao usar o `.get` em uma page, widget, store, etc, você estará aumentando o acoplamento do `Modular` ao seu projeto. Isso obviamente dificulta uma manutenção e substituição.

### ModularState

O `ModularState` alterá o ciclo de vida da injeção, o que dificulta a manutenção, e pode ser substituído facilmente por uma injeção tradicional.

### RouterOutlet

O `RouterOutlet` aumenta o acoplamento também e torna difícil a substituição dele por outra solução, então caso seja preciso substituir, precisará mudar no `module.dart` e mudaria a estrutura, por causa das rotas e etc.

### Modular.to.navigate

O `Modular.to.navigate` limpa a 'pilha' de rotas e navega para a página alvo, ja apresentou uns bugs, então dou preferência a usar outros métodos

---

## Modular 5

### MaterialApp.modular()

Mudança na construção na raiz, antigamente, o código era `MaterialApp.router()`, `CupertinoApp.router()` ou `FluentApp.router()`, a mudança afeta mais o funcionamento interno e como era feito.

Deve ser substituído por `MaterialApp.router` com as seguintes dependências `Modular.routeInformationParser` e `Modular.routerDelegate`

```dart
@override
Widget build(BuildContext context) {
  return MaterialApp.router(
    routeInformationParser: Modular.routeInformationParser,
    routerDelegate: Modular.routerDelegate,
  );
}
```

### onDispose

Na versão 4, o dispose era interno, então você não disposava do jeito que quisesse, era feito por debaixo dos pano, e era responsabilidade demais para o Modular saber o tipo de classe para disposar de modo correto, então isso foi alterado e passado a responsabilidade para quem o usa.

Como pode ser observado, na hora de injetar, voce passa o que deve ser feito na hora do dispose.

Não pode ser usado em factory, factories não são disposadas, são totalmente removidas.  
Obs.: Para tipar corretamente, é preciso fazer uso de `Generics` depois do `singleton` nesse caso, ou na passagem do método

```dart
Bind.singleton<MyBloc>(
  (i) => MyBloc(),
  onDispose: <MyBloc>(bloc) => bloc.close()
);
```

### ModularState

Depreciado, porque era ruim por questão arquitetural e de clean code.

### Sistema de Import e Export

Antigamente, era possível para uma sub dependência importada, de modo que ao importar a primeira, o resto seria importando junto, isso não é mais possível.

Imagine a seguinte construção:

```dart
class AppModule {
  final imports = [Module2()];
}

class Module2 {
  final imports = [Module3()];

  final binds = [
    BindExported01(export: true),
    BindExportedModule02(export: true),
  ];
}

class Module3 {
  final binds = [
    BindNotExported01(export: true),
    BindNotExportedModule02(export: true),
  ];
}
```

Seguindo essa construção:  
O Modular 5 não vai ter exportado os binds do `Module3` para o `AppModule`, porque o `Module2` importa, esses binds, estão disponíveis apenas no `Module2`, não no `AppModule`.

De modo resumido, não existe mais importe indireto, apenas direto.  
Se o Modulo importa, ele tem acesso, mas os módulos que fazem o importe de quem importa, não terá acesso.  
Um meio de manter a mesma organização, seria fazer uso do operador `spread`.  
Ficaria dessa forma:

Pode observar, que os binds do `Module3`, não são mais importados, eles se tornam parte do `Module2`, dessa forma, o `AppModule` tem acesso

```dart
class AppModule {
  final imports = [Module2()];
}

class Module2 {
  final imports = [];

  final binds = [
    ...Module3().binds,
    BindExported01(export: true),
    BindExportedModule02(export: true),
  ];
}

class Module3 {
  final binds = [
    BindNotExported01(export: true),
    BindNotExportedModule02(export: true),
  ];
}


```
