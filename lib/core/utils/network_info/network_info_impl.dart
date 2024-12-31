// Importing the required package to check internet connection status.
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// Importing the abstract class to implement its contract.
import 'network_info.dart';

// Implementation of the NetworkInfo interface to check network connectivity.
class NetworkInfoImpl implements NetworkInfo {
  // Constructor for NetworkInfoImpl. No additional setup is required here.
  NetworkInfoImpl();

  // Overrides the isConnected getter to use the InternetConnectionChecker library.
  // It checks if the device has access to the internet and returns a Future<bool>.
  @override
  Future<bool> get isConnected => InternetConnection().hasInternetAccess;
}
