# arch_class2

O que foi decidido
Porque foi decidido

# Arquitetura
Foi decidido fazer na estrutura de micro frontends, porque ela torna mais facil fazer upgrade de packages de framework, deixa oa módulos mais dificeis de serem acoplados a outros módulos, preferimos fazer em monorepo devido por não achar necessario a divisão em varios repos, porque isso tornaria o desenvolvimento mais cansativo e não teria um bonus muito claro.

## Camadas

### Domain
  Deve ficar a nossa regra de negócio, as validações do sistema, como por exemplo, o que é um email válido.
  Entities: Toda entidade deve obrigatoriamente ter um id
  Usecase: Deve ter somente um método público, ele deve ser chamado `call`
  A camada de domain deve ter 100% de coverage


Arquitetura
  Monorepo/Multi/Monolitico/Microfrontend
  DesignSystem
    Quais são as regras do DS?
    Quais são os padrões?
    O que um Widget deve fazer?
    O que é um Componente?
    Por que usar o Theme?
    Deve ser usado como prefixo um nome do DS
    O sufixo deve ser o que ele é (Card, AppBar, Field)
    Todo arquivo deve ter o sufixo `_widget`
    Os widget não deve ter tamanho nem se posicionar na tela, quem usa que manda os params ou posiciona

    Todo widget deve ser exemplificado no widgetbook
  Nomenclatura
    Interfaces não devem ter qualquer notação, deve ser o nome `puro`
    As Implementações devem ter `Impl` como sufixo

  O que é um modulo?
    Porque modularizar

  Git
    As branchs devem ter os prefixos `feat`, `refac`, `style`, `deploy`, `test`, `fix`
    Deve ser nomeado como `<verbo>/<sistema>/<task_code>` - `feat/app/937`
    Os commits deve seguir o padrão
      `[<verbo>]: Breve descrição

      Descrição detalhada
      `
  O que é o Core?
    O que pode/deve estar lá

  Não deve ter mais de 3 params em um metodo/funcão
  O metodo/fn não deve mais de 40 linhas


Clean Arch - Flutterando
  Presenter - Flutter - Page(Page) e Gerencia de Estado(Store, Bloc, Cubit)
  Domain - Dart - Regra de negócio(Usecase) e Entity
  Infra - Dart - Parse(Mapper) e Tratamento de exceções(Repository)
  External - Dart/Flutter - API, Bluetooth, LocalStorage(Datasource)

Fluxo de Desenvolvimento
  Domain
  Infra
  External
  Presenter

Fluxo de Acesso
  Presenter > Domain > Infra > External

  

