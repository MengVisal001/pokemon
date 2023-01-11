class Environments {
  static const String production = 'prod';
  static const String qas = 'QAS';
  static const String development = 'dev';
  static const String local = 'local';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.local;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.local,
      'url': 'http://localhost:8080/api/',
    },
    {
      'env': Environments.development,
      'url': '',
    },
    {
      'env': Environments.qas,
      'url': '',
    },
    {
      'env': Environments.production,
      'url': '',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }
}
