import 'package:flutter_bloc/flutter_bloc.dart';

import '{{name.snakeCase()}}_events.dart';
import '{{name.snakeCase()}}_states.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc() : super(const Initial{{name.pascalCase()}}State()) {
    on<Load{{name.pascalCase()}}Event>(_load);
  }

  Future<void> _load(Load{{name.pascalCase()}}Event event, Emitter<{{name.pascalCase()}}State> emit) async{
    emit(const Loading{{name.pascalCase()}}State());

    await Future.delayed(const Duration(seconds: 2));

    emit(const Success{{name.pascalCase()}}State());
  }
}