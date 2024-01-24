import '../../app.dart';
import '../../core/usecase/iusecase.dart';
import '../../data/source/sources_export.dart';

class GetBtcStreamUsecase extends IUsecase<Stream<dynamic>> {
  final CoinSocket socket = App.find();

  @override
  Stream<dynamic> call() {
    return socket.getBtcSocketData();
  }
}