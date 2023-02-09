# arch_class

- Domain  
  Responsabilidade: Regra de negócio - Validações

  - Repositories - Interface para comunicar com as outras camadas
  - Entities - Classes anemicas que contenham a modelagem dos dados
  - Usecases - Aplicação da regra de negócio

- Infra  
  Responsabilidade: Tratamento do entra e o que sai - Conversão***

  - Repositories - Implementações dos contratos solicitados na `domain`
  - Mappers - Classes que convertam suas entidades em Maps e os Maps em entidades
  - Datasources - Interface para comunicar com as outras camadas

- External
  Responsabilidade: Consumo dos dados

  - Datasource - Implementações dos contratos solicitados na `domain`

- O que testar?
  - Usecase
  - ValueObject
  - Repository
  - Mapper
  - Datasource
  - Reatividade*


Presenter
Tratamento de erro
Uso de Either/Result
Service como alternativa de Repository/Datasource
Service como Wrapper de package

<!-- UI -> Adapter -> Domain <- Adapter <- API



Domain
  Teste
    infra
      teste
        external
          teste
            presenter
              store
                teste?
                  page -->

  