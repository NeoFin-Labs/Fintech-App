// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: env/.env
final class _Env {
  static const List<int> _enviedkeyapiKey = <int>[
    1573753281,
    692449142,
    392033676,
    3883640948,
    530177015,
  ];

  static const List<int> _envieddataapiKey = <int>[
    1573753328,
    692449092,
    392033727,
    3883640896,
    530176962,
  ];

  static final String apiKey = String.fromCharCodes(
    List<int>.generate(
      _envieddataapiKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]),
  );

  static const String baseUrl = 'https://api.coingecko.com/api/v3/';
}
