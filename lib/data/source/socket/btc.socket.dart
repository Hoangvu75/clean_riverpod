import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../core/constants/constants_export.dart';

class BtcSocket {
  late final String btcSocketUrl;
  late final WebSocketChannel btcSocketChannel;

  BtcSocket() {
    btcSocketUrl = ApiUrlConstants.COIN_SOCKET_URL + ApiUrlConstants.BTC_ENDPOINT;
  }

  Stream<dynamic> getBtcSocketData() {
    btcSocketChannel = WebSocketChannel.connect(Uri.parse(btcSocketUrl));
    return btcSocketChannel.stream;
  }

  void stopBtcSocket() {
    btcSocketChannel.sink.close();
    btcSocketChannel.stream.drain();
  }
}
