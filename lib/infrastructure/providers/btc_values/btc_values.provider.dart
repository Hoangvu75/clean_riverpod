import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecases/get_btc_stream.usecase.dart';

part 'btc_values.provider.g.dart';

@riverpod
class BtcValues extends _$BtcValues {
  @override
  List<String> build() {
    GetBtcStreamUsecase().call().listen((event) => addValue(event));
    return [];
  }

  void addValue(String value) => state = [...state, value];
}
