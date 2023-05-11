import 'package:flavor_class/flavor/clients/daniel_flavor.dart';

import 'clients/default_flavor.dart';
import 'clients/fteam_flavor.dart';
import 'i_flavor_client.dart';

enum Environment { dev, stg, prd }

class AppFlavor {
  static late IClientFlavor _client;
  static IClientFlavor get client => _client;

  static bool get isDev => _client.environment == Environment.dev;
  static bool get isStg => _client.environment == Environment.stg;
  static bool get isPrd => _client.environment == Environment.prd;

  static void changeFlavor({required String env, required String client}) {
    final environment = Environment.values.byName(env);

    if (client == 'default') {
      _client = DefaultFlavor(environment: environment);
    }
    if (client == 'daniel') {
      _client = DanielFlavor(environment: environment);
    }
    if (client == 'fteam') {
      _client = FTeamFlavor(environment: environment);
    }
  }
}
