// Abstract class defining a contract for checking network connectivity.
abstract class NetworkInfo {
  // A getter that returns a Future resolving to a boolean indicating
  // whether the device is connected to a network.
  Future<bool> get isConnected;
}
