import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'connectivity_status.dart';

abstract class ConnectivityService {
  Future<ConnectivityStatus> checkConnectivity();
  Stream<ConnectivityStatus> get onConnectivityChanged;
  void dispose();
}

class ConnectivityServiceImpl implements ConnectivityService {
  final Connectivity _connectivity;
  final _controller = StreamController<ConnectivityStatus>.broadcast();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  ConnectivityServiceImpl({Connectivity? connectivity}) : _connectivity = connectivity ?? Connectivity() {
    _initialize();
  }

  void _initialize() {
    _subscription = _connectivity.onConnectivityChanged.listen(
      (results) {
        _controller.add(_mapResults(results));
      },
      onError: (error) {
        _controller.addError(error);
      },
    );
  }

  @override
  Future<ConnectivityStatus> checkConnectivity() async {
    try {
      final results = await _connectivity.checkConnectivity();
      return _mapResults(results);
    } catch (e) {
      return ConnectivityStatus.none;
    }
  }

  @override
  Stream<ConnectivityStatus> get onConnectivityChanged => _controller.stream;

  ConnectivityStatus _mapResults(List<ConnectivityResult> results) {
    if (results.isEmpty) return ConnectivityStatus.none;

    if (results.contains(ConnectivityResult.wifi)) {
      return ConnectivityStatus.wifi;
    }
    if (results.contains(ConnectivityResult.mobile)) {
      return ConnectivityStatus.mobile;
    }
    return ConnectivityStatus.none;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _controller.close();
  }
}
