import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final _connectivity = Connectivity();
  final _controller = StreamController<bool>.broadcast();

  StreamSubscription? _subscription;
  bool _isOnline = true;

  Stream<bool> get onStatusChanged => _controller.stream;
  bool get isOnline => _isOnline;

  Future<void> init() async {
    _isOnline = await _checkInternet();

    _subscription = _connectivity.onConnectivityChanged.listen((result) async {
      final hasConnection = result.contains(ConnectivityResult.none)
          ? await _checkInternet()
          : true;

      if (hasConnection != _isOnline) {
        _isOnline = hasConnection;
        _controller.add(_isOnline);
      }
    });
  }

  Future<bool> _checkInternet() async {
    final List<ConnectivityResult> result = await _connectivity
        .checkConnectivity();
    return !(result.contains(ConnectivityResult.none));
  }

  void dispose() {
    _subscription?.cancel();
    _controller.close();
  }
}
