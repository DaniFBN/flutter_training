import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:offline_first_class/app/core/shared/services/connection/i_connection_service.dart';

class PlusConnectionService implements IConnectionService {
  final Connectivity _connectivity;
  @override
  final ValueNotifier<bool> hasConnection;
  late final StreamSubscription _subscription;

  PlusConnectionService(this._connectivity)
      : hasConnection = ValueNotifier(false) {
    _connectivity.checkConnectivity().then(_changeConnection);

    _subscription =
        _connectivity.onConnectivityChanged.listen(_changeConnection);
  }

  @override
  void dispose() {
    _subscription.cancel();
    hasConnection.dispose();
  }

  void _changeConnection(ConnectivityResult connectivityResult) {
    final isConnected = connectivityResult != ConnectivityResult.none;

    hasConnection.value = isConnected;
  }
}
