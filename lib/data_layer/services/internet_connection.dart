import 'package:connectivity_plus/connectivity_plus.dart';
Future<String> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.wifi) {
    return 'Connected to Wi-Fi';
  } else if (connectivityResult == ConnectivityResult.mobile) {
    return 'Connected to Mobile Data';
  } else {
    return 'No internet connection';
  }
}