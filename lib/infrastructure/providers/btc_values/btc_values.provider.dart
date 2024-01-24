import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/usecase/iusecase.dart';
import '../../../domain/usecases/get_btc_stream.usecase.dart';

part 'btc_values.provider.g.dart';

@riverpod
class BtcValues extends _$BtcValues {
  @override
  List<String> build() {
    GetBtcStreamUsecase().call(NoParams()).then(
          (value) => value.listen(
            (event) => ref.read(btcValuesProvider.notifier).addValue(event),
          ),
        );
    return [];
  }

  List<String> get values => state;

  void addValue(String value) => state = [...state, value];
}
