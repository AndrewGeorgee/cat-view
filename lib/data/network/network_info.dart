import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInformation {
  Future<bool> get isConnected;
}

class NetworkInfoImp implements NetworkInformation {
  InternetConnectionChecker internetConnectionChecker;
  NetworkInfoImp(this.internetConnectionChecker);

  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
