Fluxo de acesso
Presenter(Page) -> Presenter(Reatividade) -> Domain(Usecase) -> Infra(Repository) -> External(Datasource)

Fluxo de desenvolvimento
Domain -> Infra -> External -> Presenter
Domain -> Test -> Infra -> Test -> External -> Test -> Presenter
