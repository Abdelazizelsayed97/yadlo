import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetConnection{
  Future<bool> get isConnected ;

}
class InternetConnectionImpl extends InternetConnection{
 final InternetConnectionChecker internetConnectionChecker;

  InternetConnectionImpl({required this.internetConnectionChecker});

  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}