import 'dart:developer';
import 'package:configcat_client/configcat_client.dart';

class ConfigService {
  static const _sdkKey =
      'configcat-sdk-1/s9vcCJ05R0GJhGJQLsUyeQ/zsUvybhLSEy0Lft5efj0tg';

  late final ConfigCatClient _client;

  late final bool _usePrivacy;

  late final String _link;

  Future<ConfigService> init() async {
    _client = ConfigCatClient.get(sdkKey: _sdkKey);

    _usePrivacy = await _client.getValue<bool>(
        key: ConfigKey.useprivacy.name, defaultValue: true);
    _link = await _client.getValue<String>(
        key: ConfigKey.link.name, defaultValue: '');
    log('$_usePrivacy, $_link');
    return this;
  }

  bool get usePrivacy => _usePrivacy;

  String get link => _link;

  void closeClient() => _client.close();
}

enum ConfigKey {
  link,
  useprivacy,
}
