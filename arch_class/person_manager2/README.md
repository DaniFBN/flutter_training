Observer Pattern

Alguem avisa

  ValueNotifier - value(setter)

  ChangeNotifier - notifyListeners()

  Bloc - emit()

  Cubit - emit()

  Triple - update(state), setLoading(), setError()

Alguem ouve

  ValueNotifier

    Widget - ValueListenableBuilder, AnimatedBuilder

    Lógica - notifier.addListener

  ChangeNotifier

    Widget - AnimatedBuilder

    Lógica - addListener

  Bloc

    Widget - BlocBuilder, BlocConsumer

    Lógica - bloc.stream.listen

  Cubit

    Widget - BlocBuilder, BlocConsumer

    Lógica - cubit.stream.listen

  Triple

    Widget - TripleBuilder(triple), ScopedBuilder(triple), ValueListenableBuilder(triple.select<State|Error|Loading>), AnimatedBuilder(triple.select<State|Error|Loading>)

    Lógica - triple.observer, triple.select<State|Error|Loading>.addListener

---

Core

  Modules

    Presenter - Page, Reativiade, Controller

    Domain - Usecase

    Infra - Repository

    External - Datasource, Services

Modules

  Presenter - Page, Reativiade, Controller

  Domain - Usecase

  Infra - Repository

  External - Datasource, Services


 