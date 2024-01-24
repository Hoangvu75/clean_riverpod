import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrlConstants {
  ApiUrlConstants._();

  static String BASE_URL = dotenv.get('BASE_URL');
  static const String ACTIVITY_ENDPOINT = "/api/activity";
  static String COIN_SOCKET_URL = dotenv.get('COIN_SOCKET_URL');
  static String BTC_ENDPOINT = dotenv.get('BTC_ENDPOINT');
}