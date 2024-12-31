import 'package:connectivity_plus/connectivity_plus.dart'; // Import for mobile

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  // Constructor for mobile platforms
  NetworkInfoImpl({required this.connectivity});

  @override
  Future<bool> get isConnected async {
    // Use the Connectivity package to check connectivity for Android/iOS
    var connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true; // Connected
    } else {
      return false; // No connection
    }
  }
}
