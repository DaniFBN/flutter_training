typedef VoidCallback = void Function();

void dartNotifier() {
  final notifier = Notifier(0);
  notifier.addListener(() => print(notifier.value));

  notifier.value = 3;
  notifier.value = 5;
  notifier.value = 9;
  notifier.value = 9;

  notifier.removeListener(() => print(notifier.value));

  notifier.value = 7;
}

class Notifier {
  final List<VoidCallback> _listeners;

  void addListener(VoidCallback callback) => _listeners.add(callback);
  void removeListener(VoidCallback callback) => _listeners.remove(callback);

  Notifier(this._value) : _listeners = <VoidCallback>[];

  int _value;
  int get value => _value;
  set value(int value) {
    if (value == _value) return;

    _value = value;
    _notifyListeners();
  }

  _notifyListeners() {
    for (var listener in _listeners) {
      listener.call();
    }
  }
}
