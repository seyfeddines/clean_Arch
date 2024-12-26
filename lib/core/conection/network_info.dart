import 'dart:html' as html; // Import for web
import 'package:connectivity_plus/connectivity_plus.dart'; // Import for mobile

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity? connectivity;

  // Constructor that works for both web and mobile platforms
  NetworkInfoImpl({this.connectivity});

  @override
  Future<bool> get isConnected async {
    // Check if we're running on the web
    if (html.window.navigator.onLine != null) {
      // For Web, use html.window.navigator.onLine to check the connection
      return html.window.navigator.onLine!;
    } else if (connectivity != null) {
      // For mobile (Android/iOS), use the Connectivity package to check connectivity
      var connectivityResult = await connectivity!.checkConnectivity();

      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        return true;
      } else {
        return false; // No connection
      }
    } else {
      return false; // Default to false if connectivity is not available
    }
  }
}
