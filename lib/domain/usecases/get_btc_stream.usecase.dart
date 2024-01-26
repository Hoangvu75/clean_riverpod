import '../../core/usecase/iusecase.dart';
import '../../data/source/sources_export.dart';

class GetBtcStreamUsecase extends IUsecase<Stream<dynamic>> {
  BtcSocket? coinSocket;

  @override
  Stream<dynamic> call() {
    coinSocket = BtcSocket();
    return coinSocket?.getBtcSocketData() ?? const Stream.empty() ;
  }

  void stop() {
    coinSocket?.stopBtcSocket();
    coinSocket = null;
  }
}