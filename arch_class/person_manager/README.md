Observer

- Quem notifica
  - ValueNotifier - value(setter)
  - BLoC - emit()
  - Triple - setLoading, setError, update
- Quem ouve
  - ValueNotifier - Nativo
    - Widget - ValueListenableBuilder, AnimatedBuilder
    - Lógica - notifier.addListener
  - BLoC - Pattern
    - Widget - BlocConsumer, BlocBuilder, StreamBuilder
    - Lógica - bloc.stream.listen
  - Triple - Pattern
    - Widget - ScopedBuilder, TripleBuilder, ValueListenableBuilder(triple.select<State|Loading|Error>), AnimatedBuilder(triple.select<State|Loading|Error>)
    - Lógica - triple.observer, triple.select<State|Loading|Error>.addListener
