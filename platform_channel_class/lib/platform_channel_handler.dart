import 'dart:convert';

import 'package:flutter/services.dart';

import 'models/user_model.dart';

class PlatformChannelHandler {
  const PlatformChannelHandler();

  final methodChannel = const MethodChannel('method_channel_class');
  final methodChannel2 = const MethodChannel('method_channel_class2');

  final eventChannel = const EventChannel('event_channel_class');

  Future<int> getBatteryLevel() async {
    final result = await methodChannel.invokeMethod<int>('getBattery');
    return result!;
  }

  Future<String> getHelloMessage(String name) async {
    final result = await methodChannel.invokeMethod<String>(
      'getHelloMessage',
      {"name": name},
    );
    return result!;
  }

  Future<List<int>> getList1() async {
    final result = await methodChannel.invokeListMethod<int>('getList');
    return result!;
  }

  Future<List<int>> getList2() async {
    final result = await methodChannel2.invokeListMethod<int>('getList');
    return result!;
  }

  Future<Map<String, int>> getMap() async {
    final result = await methodChannel.invokeMapMethod<String, int>('getMap');
    return result!;
  }

  Future<List<UserModel>> getJson() async {
    final result = await methodChannel.invokeMethod<String>('getJson');

    final resultDecoded = jsonDecode(result!) as List;
    final usersMap = List<Map<String, dynamic>>.from(resultDecoded);

    final users = usersMap.map(UserModel.fromMap).toList();

    return users;
  }

  Stream<int> getRandomNumbers() {
    final result = eventChannel.receiveBroadcastStream();
    return result.cast<int>();
  }
}
