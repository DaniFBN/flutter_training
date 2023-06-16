// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

Future<void> dartStream() async {
  // Stream
  final stream = myStream();

  final subscription = stream.listen(print);
  final subscription2 = stream.listen(print);

  await Future.delayed(Duration(seconds: 3));
  subscription.cancel();
  subscription2.cancel();

  // StreamController
  final streamController = StreamController<int>.broadcast();
  final subscription3 = streamController.stream.listen(print);
  streamController.add(23);
  streamController.add(47);
  streamController.add(72);

  await Future.delayed(Duration(seconds: 1));

  subscription3.cancel();
  streamController.close();

  // StreamYield
  final stream2 = customStream();
  final subscription4 = stream2.listen(print);
  await Future.delayed(Duration(seconds: 4));
  subscription4.cancel();
}

Stream<int> myStream() {
  return Stream.periodic(Duration(milliseconds: 500), (count) => count)
      .asBroadcastStream();
}

Stream<State> customStream() async* {
  yield LoadingState();

  await Future.delayed(Duration(seconds: 1));

  yield SuccessState();

  await Future.delayed(Duration(seconds: 1));

  yield ErrorState();
}

class State {
  @override
  String toString() => '$runtimeType';
}

class LoadingState extends State {}

class SuccessState extends State {}

class ErrorState extends State {}

