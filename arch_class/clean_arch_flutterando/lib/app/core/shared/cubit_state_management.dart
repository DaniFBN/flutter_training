import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'state_management.dart';

class CubitStateManagement<State extends Object> extends Cubit<State>
    implements StateManagement<State> {
  CubitStateManagement(super.initialState);

  @override
  StreamSubscription<State> listenWhen<FilteredType extends State>(
    OnListenData<FilteredType> onData,
  ) {
    final filteredStream =
        stream.where((e) => e is FilteredType).cast<FilteredType>();

    return filteredStream.listen(onData);
  }

  @override
  void dispose() {
    close();
  }
}
