import 'package:connectivity_plus/connectivity_plus.dart';

/// Watches network connectivity and exposes a simple [isOnline] getter.
class ConnectivityService {
  ConnectivityService._();
  static final ConnectivityService instance = ConnectivityService._();

  bool _isOnline = false;
  bool get isOnline => _isOnline;

  final _connectivity = Connectivity();

  Future<void> init() async {
    final result = await _connectivity.checkConnectivity();
    _isOnline = _check(result);
    _connectivity.onConnectivityChanged.listen((result) {
      _isOnline = _check(result);
    });
  }

  bool _check(List<ConnectivityResult> results) =>
      results.any((r) =>
          r == ConnectivityResult.mobile ||
          r == ConnectivityResult.wifi ||
          r == ConnectivityResult.ethernet);

  Stream<bool> get onlineStream => _connectivity.onConnectivityChanged
      .map((results) => _check(results));
}
