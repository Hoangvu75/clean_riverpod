import '../../app.dart';
import '../../core/usecase/iusecase.dart';
import '../../data/source/sources_export.dart';

class GetBtcStreamUsecase implements IUseCase<Stream<dynamic>, NoParams> {
  final CoinSocket socket = App.find();

  @override
  Future<Stream<dynamic>> call(NoParams params) async {
    return socket.getBtcSocketData();
  }
}