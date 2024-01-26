import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/usecases/get_btc_stream.usecase.dart';

part 'btc_values.provider.g.dart';

@Riverpod()
class BtcValues extends _$BtcValues {
  final GetBtcStreamUsecase usecase = GetBtcStreamUsecase();
  final List<String> btcData = [];

  @override
  Stream<List<String>> build() async* {
    await for (final event in usecase.call()) {
      btcData.add(event);
      yield btcData;
    }
    ref.onDispose(() => usecase.stop());
  }
}
