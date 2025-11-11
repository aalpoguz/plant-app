import 'dart:async';
import 'package:flutter/foundation.dart';
import 'connectivity_service.dart';
import 'connectivity_status.dart';

/// Manages connectivity state across the app
class ConnectivityProvider extends ChangeNotifier {
  final ConnectivityService _connectivityService;
  StreamSubscription<ConnectivityStatus>? _subscription;

  ConnectivityStatus _status = ConnectivityStatus.none;
  ConnectivityStatus get status => _status;

  bool get isConnected => _status != ConnectivityStatus.none;
  bool get isWifi => _status == ConnectivityStatus.wifi;
  bool get isMobile => _status == ConnectivityStatus.mobile;

  ConnectivityProvider({required ConnectivityService connectivityService}) : _connectivityService = connectivityService {
    _init();
  }

  Future<void> _init() async {
    _status = await _connectivityService.checkConnectivity();
    notifyListeners();

    _subscription = _connectivityService.onConnectivityChanged.listen((status) {
      _status = status;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _connectivityService.dispose();
    super.dispose();
  }
}
