import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../core/constants/constants_export.dart';

class CoinSocket {
  late final String btcSocketUrl;
  late final WebSocketChannel btcSocketChannel;

  CoinSocket() {
    onInit();
  }

  Future<void> onInit() async {
    btcSocketUrl = ApiUrlConstants.COIN_SOCKET_URL + ApiUrlConstants.BTC_ENDPOINT;
    btcSocketChannel = WebSocketChannel.connect(Uri.parse(btcSocketUrl));
    await btcSocketChannel.ready;
  }

  Stream<dynamic> getBtcSocketData() {
    return btcSocketChannel.stream;
  }
}
