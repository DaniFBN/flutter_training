import 'package:flutter/material.dart';

class CounterController extends InheritedNotifier<ValueNotifier<int>> {
  CounterController({super.key, required super.child}) : super(notifier: ValueNotifier(0));

  int get counter => notifier!.value;

  void increment() {
    notifier!.value++;
  }

  static CounterController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterController>()!;
  }

  @override
  bool updateShouldNotify(CounterController oldWidget) {
    return notifier!.value != oldWidget.notifier!.value;
  }
}
