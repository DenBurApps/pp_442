import 'dart:convert';

import 'package:flagsmith/flagsmith.dart';

class ConfigService {
  static const _apikey = 'hPmZk2nPHLPhVDEtKosofn';
  // TODO insert flagsmith key here

  late FlagsmithClient _flagsmithClient;

  late String _link;
  late bool _usePrivacy;

  Future<ConfigService> init() async {
    _flagsmithClient = await FlagsmithClient.init(
      apiKey: _apikey,
      config: const FlagsmithConfig(caches: true),
    );
    await _flagsmithClient.getFeatureFlags(reload: true);

    final config = jsonDecode(
        await _flagsmithClient.getFeatureFlagValue(ConfigKey.config.name) ??
            '') as Map<String, dynamic>;

    _link = config[ConfigKey.link.name];
    _usePrivacy = config[ConfigKey.usePrivacy.name];
    return this;
  }

  void closeClient() => _flagsmithClient.close();

  bool get usePrivacy => _usePrivacy;

  String get link => _link;
}

enum ConfigKey {
  config,
  link,
  usePrivacy,
}
